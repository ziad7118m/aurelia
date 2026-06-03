import 'package:aurelia/core/api/token_interceptor.dart';
import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioFactory {
  DioFactory._();
  static Dio createDio(){
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),

    );
    return dio;
  }
}