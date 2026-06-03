import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_result.dart';
import '../../data/repos/auth_repo.dart';
import 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo authRepo;

  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    emit(VerifyEmailLoading());

    final result = await authRepo.verifyEmail(
      email: email,
      otp: otp,
    );

    if (result is ApiSuccess<void>) {
      emit(VerifyEmailSuccess());
    } else if (result is ApiError<void>) {
      emit(VerifyEmailFailure(result.message));
    }
  }
}