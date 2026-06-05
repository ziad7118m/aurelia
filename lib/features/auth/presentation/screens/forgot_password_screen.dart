import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_validators.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubit/forgot_password_cubit.dart';
import '../../logic/cubit/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            Navigator.pushReplacementNamed(
              context,
              Routes.resetPassword,
              arguments: emailController.text.trim(),
            );
          } else if (state is ForgotPasswordFailure) {
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
                  const Text(
                    'Enter your email and we will send you an OTP code.',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: AppValidators.email,

                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: state is ForgotPasswordLoading
                        ? null
                        : () {
                      if (formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().forgotPassword(
                          email: emailController.text.trim(),
                        );
                      }
                    },
                    child: state is ForgotPasswordLoading
                        ? const CircularProgressIndicator()
                        : const Text('Send OTP'),
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