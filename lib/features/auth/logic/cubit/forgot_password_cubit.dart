import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_result.dart';
import '../../data/repos/auth_repo.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo authRepo;

  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoading());

    final result = await authRepo.forgotPassword(email: email);

    if (result is ApiSuccess<void>) {
      emit(ForgotPasswordSuccess());
    } else if (result is ApiError<void>) {
      emit(ForgotPasswordFailure(result.message));
    }
  }
}