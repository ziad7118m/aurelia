import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_result.dart';
import '../../data/repos/auth_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());

    final result = await authRepo.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );

    if (result is ApiSuccess<void>) {
      emit(ResetPasswordSuccess());
    } else if (result is ApiError<void>) {
      emit(ResetPasswordFailure(result.message));
    }
  }
}