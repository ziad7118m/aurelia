import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_validators.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/verify_email_cubit.dart';
import '../../logic/cubit/verify_email_state.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;

  const VerifyEmailScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Email verified successfully. Please login.'),
              ),
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
                  (route) => false,
            );
          } else if (state is VerifyEmailFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }else if (state is ResendOtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent successfully.'),
              ),
            );
          } else if (state is ResendOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter the OTP sent to ${widget.email}',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'OTP Code',
                  ),
                  validator: AppValidators.otp,
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: state is VerifyEmailLoading
                      ? null
                      : () {
                    context.read<VerifyEmailCubit>().verifyEmail(
                      email: widget.email,
                      otp: otpController.text.trim(),
                    );
                  },
                  child: state is VerifyEmailLoading
                      ? const CircularProgressIndicator()
                      : const Text('Verify'),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: state is ResendOtpLoading
                      ? null
                      : () {
                    context.read<VerifyEmailCubit>().resendOtp(
                      email: widget.email,
                    );
                  },
                  child: state is ResendOtpLoading
                      ? const Text('Sending...')
                      : const Text('Resend OTP'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}