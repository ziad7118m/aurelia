abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailSuccess extends VerifyEmailState {}

class VerifyEmailFailure extends VerifyEmailState {
  final String message;

  VerifyEmailFailure(this.message);
}

class ResendOtpLoading extends VerifyEmailState {}

class ResendOtpSuccess extends VerifyEmailState {}

class ResendOtpFailure extends VerifyEmailState {
  final String message;

  ResendOtpFailure(this.message);
}