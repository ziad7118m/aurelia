import 'package:aurelia/features/auth/data/models/auth_token_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_result.dart';
import '../../data/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await authRepo.login(
      email: email,
      password: password,
    );

    if (result is ApiSuccess<AuthTokenModel>) {
      emit(LoginSuccess());
    } else if (result is ApiError<AuthTokenModel>) {
      emit(LoginFailure(result.message));
    }
  }
}