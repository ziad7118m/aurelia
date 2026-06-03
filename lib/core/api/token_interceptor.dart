import 'package:aurelia/core/cache/secure_storage_helper.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await SecureStorageHelper.getAccessToken();
    if(accessToken != null && accessToken.isNotEmpty){
      options.headers['Authorization']='Bearer $accessToken';
    }
    handler.next(options);
  }
}