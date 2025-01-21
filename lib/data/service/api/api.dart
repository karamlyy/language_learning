import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/base/response_model.dart';
import 'package:language_learning/data/service/api/api_interceptor.dart';
import 'package:language_learning/data/service/api/logging.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';
import 'package:retry/retry.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options
      ..baseUrl = ApiRoutes.baseUrl
      ..contentType = "application/json-patch+json"
      ..headers = {};

    _disableSSLCertificateValidation();

    // Added optimizations for faster connection and retries
    _dio.options
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5);

    _dio.interceptors.add(Logging());
    _dio.interceptors.add(ApiInterceptor(dio: _dio));
  }

  // Function to disable SSL certificate validation
  void _disableSSLCertificateValidation() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  // Set shorter retry delays to quickly retry failed requests
  final _retryOptions = const RetryOptions(
    maxAttempts: 3,
    delayFactor: Duration(milliseconds: 500), // Reduced delay factor
  );

  Future<Either<HttpException, T>> task<T>(Endpoint endpoint) async {
    try {
      final result = await _retryOptions.retry(
        () => _executeRequest(endpoint),
        retryIf: (e) => e is DioException && _shouldRetry(e),
      );
      return Right(await _handle<T>(result));
    } on DioException catch (e) {
      return Left(await _handleError(e));
    }
  }

  Future<Response> _executeRequest(Endpoint endpoint) async {
    switch (endpoint.httpMethod) {
      case HttpMethod.get:
        return _dio.get(
          endpoint.route,
          queryParameters: endpoint.queryParameters,
        );
      case HttpMethod.post:
        return _dio.post(
          endpoint.route,
          data: endpoint.body,
          queryParameters: endpoint.queryParameters,
        );
      case HttpMethod.put:
        return _dio.put(
          endpoint.route,
          data: endpoint.body,
          queryParameters: endpoint.queryParameters,
        );
      case HttpMethod.delete:
        return _dio.delete(
          endpoint.route,
          data: endpoint.body,
          queryParameters: endpoint.queryParameters,
        );
    }
  }

  Future<dynamic> _handle<T>(Response response) async {
    if ([200, 201, 203, 204].contains(response.statusCode)) {
      final request = ResponseModel<T>.fromJson(response.data);

      if (request.isSuccessful && request.hasData) {
        return request.data;
      } else if (request.isSuccessful && !request.hasData) {
        return request.message;
      } else {
        return HttpException(error: ErrorMessage(message: request.message ?? "", code: request.status));
      }
    } else {
      return HttpException(
        error: ErrorMessage(message: response.statusMessage ?? "Unknown error", code: response.statusCode),
      );
    }
  }

  Future<HttpException> _handleError(DioException e) async {
    String errorMessage = "An unknown error occurred";
    int? statusCode;

    if (e.response?.data != null) {
      final data = e.response!.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('title')) {
          errorMessage = data['title'] ?? errorMessage;
        }
      }
      statusCode = e.response!.statusCode;
    }

    return HttpException(
      error: ErrorMessage(
        message: errorMessage,
        code: statusCode,
      ),
    );
  }

  // Reduced retries to improve response speed in case of failures
  bool _shouldRetry(DioException e) {
    return e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout;
  }
}
