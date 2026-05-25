import 'package:aurelia/core/api/api_result.dart';

import '../../../../core/cache/secure_storage_helper.dart';
import '../../../../core/errors/api_error_handler.dart';
import '../models/auth_token_model.dart';
import '../models/user_model.dart';
import '../remote/auth_remote_data_source.dart';

class AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepo(this.authRemoteDataSource);

  Future<ApiResult<AuthTokenModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authToken = await authRemoteDataSource.login(
        email: email,
        password: password,
      );

      await SecureStorageHelper.saveAccessToken(authToken.accessToken);
      await SecureStorageHelper.saveRefreshToken(authToken.refreshToken);

      return ApiSuccess(authToken);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handleError(error);

      return ApiError(errorMessage);
    }
  }

  Future<ApiResult<void>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await authRemoteDataSource.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      return const ApiSuccess(null);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handleError(error);

      return ApiError(errorMessage);
    }
  }

  Future<ApiResult<UserModel>> getCurrentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUser();

      return ApiSuccess(user);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handleError(error);

      return ApiError(errorMessage);
    }
  }

  Future<void> logout() async {
    await SecureStorageHelper.clearTokens();
  }
}