import 'package:aurelia/core/routing/routes.dart';
import 'package:aurelia/features/auth/logic/cubit/login_cubit.dart';
import 'package:aurelia/features/auth/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localization_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('login'))),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          }else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: state is LoginLoading
                      ? null
                      : () {
                          context.read<LoginCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        },
                  child: state is LoginLoading? const CircularProgressIndicator() :
                  Text(context.translate('login')),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: Text(context.translate('createAccount')),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
