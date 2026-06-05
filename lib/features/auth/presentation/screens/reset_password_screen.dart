import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_validators.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/reset_password_cubit.dart';
import '../../logic/cubit/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    otpController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset successfully. Please login.'),
              ),
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
                  (route) => false,
            );
          } else if (state is ResetPasswordFailure) {
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset password for ${widget.email}',
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

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: newPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'New Password',
                    ),
                    validator: AppValidators.password,

                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: state is ResetPasswordLoading
                        ? null
                        : () {
                      if (formKey.currentState!.validate()) {
                        context.read<ResetPasswordCubit>().resetPassword(
                          email: widget.email,
                          otp: otpController.text.trim(),
                          newPassword: newPasswordController.text.trim(),
                        );
                      }
                    },
                    child: state is ResetPasswordLoading
                        ? const CircularProgressIndicator()
                        : const Text('Reset Password'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}