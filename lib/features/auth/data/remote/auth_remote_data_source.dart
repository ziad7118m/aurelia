import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../models/auth_token_model.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<AuthTokenModel> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      ApiConstants.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthTokenModel.fromJson(response.data);
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    await dio.post(
      ApiConstants.register,
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      },
    );
  }

  Future<UserModel> getCurrentUser() async {
    final response = await dio.get(ApiConstants.me);

    return UserModel.fromJson(response.data);
  }

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    await dio.post(
      ApiConstants.verifyEmail,
      data: {
        'email': email,
        'otp': otp,
      },
    );
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    await dio.post(
      ApiConstants.resendOtp,
      data: {
        'email': email,
      },
    );
  }
}