import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/constants.dart';
import '../helpers/shared_pref_helper.dart';
import 'api_constants.dart';

class DioFactory {
  static Dio? dio;

  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Future<void> addDioHeaders() async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken)}',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add headers dynamically before every request
          await addDioHeaders();
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          // Check if the error is due to token expiration
          if (error.response?.statusCode == 401) {
            try {
              // Attempt to refresh the token
              await _refreshToken();

              // Retry the original request with the new token
              final newRequest = error.requestOptions;
              newRequest.headers['Authorization'] =
                  'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken)}';

              final response = await dio?.fetch(newRequest);
              return handler.resolve(response!);
            } catch (e) {
              // If token refresh fails, forward the error
              return handler.next(error);
            }
          }
          return handler.next(error);
        },
      ),
    ]);
  }

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> _refreshToken() async {
    final refreshToken =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);

    if (refreshToken == null || refreshToken.isEmpty) {
      throw Exception("Refresh token not found.");
    }

    try {
      final url =
          '${ApiConstants.apiBaseUrl}auth/refresh-token?token=$refreshToken';
      final response = await dio?.request(
        url,
        options: Options(
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response?.statusCode == 200) {
        final newAccessToken = response?.data['access_token'];
        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.accessToken, newAccessToken);
      } else {
        throw Exception("Failed to refresh token.");
      }
    } catch (e) {
      rethrow;
    }
  }
}
