import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';


// class ApiInterceptor extends Interceptor {
//   final Dio dio;
//
//   ApiInterceptor({required this.dio});
//
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final prefs = await PreferencesService.instance;
//
//     options.headers["accept"] = "*/*";
//     options.headers["Accept-Encoding"] = "gzip, deflate, br";
//
//     if (prefs.accessToken != null) {
//       options.headers["Authorization"] = "Bearer ${prefs.accessToken}";
//     }
//
//     log("HEADERS: ${options.headers}");
//     return handler.next(options);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     final prefs = await PreferencesService.instance;
//
//     if (err.response?.statusCode == 401) {
//       final data = err.response?.data;
//       if (data is Map<String, dynamic> && data.containsKey('code')) {
//         final errorCode = data['code'];
//
//         if (errorCode == 100) {
//           // Clear session for code: 100
//           await _clearSession();
//           return handler.reject(err);
//         } else if (errorCode == 101) {
//           // Refresh token for code: 101
//           try {
//             final refreshResult = await dio.post(
//               ApiRoutes.refreshToken,
//               // Replace with your refresh token endpoint
//               data: {
//                 "refreshToken": prefs.refreshToken,
//               },
//             );
//
//             // Update new token
//             final newAccessToken = refreshResult.data["token"];
//             await prefs.setAccessToken(newAccessToken);
//
//             // Retry the original request with the new token
//             final options = err.requestOptions;
//             options.headers["Authorization"] = "Bearer $newAccessToken";
//             final response = await dio.fetch(options);
//             return handler.resolve(response);
//           } catch (e) {
//             // If refresh token fails, clear session
//             await _clearSession();
//             return handler.reject(err);
//           }
//         }
//       }
//     }
//
//     String errorMessage = "An error occured";
//
//     if (err.response != null) {
//       final data = err.response?.data;
//       final statusCode = err.response?.statusCode ?? 0;
//
//       if (data is Map<String, dynamic> && data.containsKey('errors')) {
//         if (data.containsKey('errors') && data['errors'] is List) {
//           errorMessage = data['errors'].join(", ");
//         }
//       } else if (data is String) {
//         errorMessage = data;
//       }
//
//       log("ERROR[$statusCode] => MESSAGE: $errorMessage");
//     }
//
//     handler.reject(
//       DioException(
//         requestOptions: err.requestOptions,
//         response: err.response,
//         type: err.type,
//         error: HttpException(
//           error: ErrorMessage(
//             message: errorMessage,
//             code: err.response?.statusCode,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _clearSession() async {
//     final prefs = await PreferencesService.instance;
//     await prefs.clear();
//     await prefs.setAuthorizationPassed(false);
//     await prefs.setOnBoardingPassed(true);
//     Navigation.pushNamedAndRemoveUntil(Routes.login, arguments: true);
//     ScaffoldMessenger.of(Navigation.navigatorKey.currentContext!).showSnackBar(
//       const SnackBar(
//         content:
//             Text("Sessiyanın vaxtı bitib. Zəhmət olmasa, yenidən daxil olun."),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;

  ApiInterceptor({required this.dio});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

    options.headers["accept"] = "*/*";
    options.headers["Accept-Encoding"] = "gzip, deflate, br";

    if (prefs.accessToken != null) {
      options.headers["Authorization"] = "Bearer ${prefs.accessToken}";
    }

    log("HEADERS: ${options.headers}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final prefs = await PreferencesService.instance;

// Əgər 401 (Unauthorized) xətası varsa, accessToken-in müddəti bitmiş ola bilər.
    if (err.response?.statusCode == 401) {
      final data = err.response?.data;
      if (data is Map<String, dynamic> && data.containsKey('code')) {
        final errorCode = data['code'];

// Access token-in vaxtı bitibsə (code 100)
        if (errorCode == 100) {
          if (prefs.refreshToken != null) {
            try {
              log("Attempting to refresh token...");
              final refreshResult = await dio.post(
                ApiRoutes.refreshToken,
                data: {
                  "refreshToken": prefs.refreshToken,
                },
              );
              log("Refresh token response: ${refreshResult.data}");

// Yeni token dəyərlərini "data" obyektinin içindən almaq lazımdır.
              final newAccessToken = refreshResult.data["data"]["accessToken"];
              final newRefreshToken = refreshResult.data["data"]["refreshToken"];

              if (newAccessToken == null || newRefreshToken == null) {
                log("New access token or refresh token is null, clearing session.");
                await _clearSession();
                return handler.reject(err);
              }

// Yeni tokenləri Preferences-də yeniləyirik
              await prefs.setAccessToken(newAccessToken);
              await prefs.setRefreshToken(newRefreshToken);

// Orijinal sorğunu yeni access token ilə təkrar göndəririk
              final options = err.requestOptions;
              options.headers["Authorization"] = "Bearer $newAccessToken";
              final response = await dio.fetch(options);
              return handler.resolve(response);
            } catch (e, stacktrace) {
              log("Error during token refresh: $e, stacktrace: $stacktrace");
              await _clearSession();
              return handler.reject(err);
            }
          } else {
// Refresh token mövcud deyilsə, sessiyanı təmizləyirik.
            await _clearSession();
            return handler.reject(err);
          }
        }
// Əlavə error kodları (məsələn, 101) üçün də eyni refresh loqikası tətbiq oluna bilər.
        else if (errorCode == 101) {
          if (prefs.refreshToken != null) {
            try {
              log("Attempting to refresh token for error code 101...");
              final refreshResult = await dio.post(
                ApiRoutes.refreshToken,
                data: {
                  "refreshToken": prefs.refreshToken,
                },
              );
              log("Refresh token response: ${refreshResult.data}");
              final newAccessToken = refreshResult.data["data"]["accessToken"];
              final newRefreshToken = refreshResult.data["data"]["refreshToken"];

              if (newAccessToken == null || newRefreshToken == null) {
                log("New access token or refresh token is null for error code 101, clearing session.");
                await _clearSession();
                return handler.reject(err);
              }

              await prefs.setAccessToken(newAccessToken);
              await prefs.setRefreshToken(newRefreshToken);

              final options = err.requestOptions;
              options.headers["Authorization"] = "Bearer $newAccessToken";
              final response = await dio.fetch(options);
              return handler.resolve(response);
            } catch (e, stacktrace) {
              log("Error during token refresh for code 101: $e, stacktrace: $stacktrace");
              await _clearSession();
              return handler.reject(err);
            }
          } else {
            await _clearSession();
            return handler.reject(err);
          }
        }
      }
    }

    String errorMessage = "An error occurred";

    if (err.response != null) {
      final data = err.response?.data;
      final statusCode = err.response?.statusCode ?? 0;

      if (data is Map<String, dynamic> && data.containsKey('errors')) {
        if (data['errors'] is List) {
          errorMessage = data['errors'].join(", ");
        }
      } else if (data is String) {
        errorMessage = data;
      }

      log("ERROR[$statusCode] => MESSAGE: $errorMessage");
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: HttpException(
          error: ErrorMessage(
            message: errorMessage,
            code: err.response?.statusCode,
          ),
        ),
      ),
    );
  }

  Future<void> _clearSession() async {
    final prefs = await PreferencesService.instance;
    await prefs.clear();
    await prefs.setAuthorizationPassed(false);
    await prefs.setOnBoardingPassed(true);
    Navigation.pushNamedAndRemoveUntil(Routes.login, arguments: true);
    ScaffoldMessenger.of(Navigation.navigatorKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text("Sessiyanın vaxtı bitib. Zəhmət olmasa, yenidən daxil olun."),
      ),
    );
  }
}