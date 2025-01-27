import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;
  int _retryCount = 0;
  bool _isSessionExpired = false;

  ApiInterceptor({required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

    // Set common headers
    options.headers.addAll({
      "accept": "text/plain",
      "Accept-Encoding": "gzip, deflate, br",
      if (prefs.accessToken != null)
        "Authorization": "Bearer ${prefs.accessToken}",
    });

    log("HEADERS: ${options.headers}");

    // Proceed with the request
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

    // If the response is successful and contains tokens, update stored tokens
    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      final data = response.data;
      if (data.containsKey('accessToken')) {
        await prefs.setAccessToken(data['accessToken']);
      }
      if (data.containsKey('refreshToken')) {
        await prefs.setRefreshToken(data['refreshToken']);
      }
      _retryCount = 0;
    }

    // Proceed with the response
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

    // Handle 401 Unauthorized errors by attempting token refresh
    if (err.response?.statusCode == 401 && _retryCount < 2) {
      _retryCount++;
      try {
        final refreshResponse = await dio.post(
          ApiRoutes.refreshToken,
          data: {"refreshToken": prefs.refreshToken},
        );

        // Update tokens and retry the failed request
        final newAccessToken = refreshResponse.data["accessToken"];
        await prefs.setAccessToken(newAccessToken);

        // Update the authorization header and retry
        err.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";
        final retriedResponse = await dio.fetch(err.requestOptions);
        return handler.resolve(retriedResponse);
      } catch (e) {
        log("Token refresh failed: $e");
      }
    }

    // Clear session if token refresh fails or retries are exhausted
    if (err.response?.statusCode == 401 && !_isSessionExpired) {
      _isSessionExpired = true;
      await _clearSession();
    }

    // Handle other errors or failed retries
    handler.reject(_mapToHttpException(err));
  }

  DioException _mapToHttpException(DioException err) {
    String errorMessage = "An unknown error occurred";

    // Extract error message if available
    if (err.response?.data is Map<String, dynamic>) {
      final data = err.response!.data;
      if (data.containsKey('title')) {
        errorMessage = data['title'] ?? errorMessage;
      }
    }

    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: HttpException(
        error: ErrorMessage(
          message: errorMessage,
          code: err.response?.statusCode,
        ),
      ),
    );
  }

  Future<void> _clearSession() async {
    final prefs = await PreferencesService.instance;
    await prefs.clear();
    await prefs.setAuthorizationPassed(false);

    //TODO: Navigate to login screen
  }
}
