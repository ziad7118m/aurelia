import 'package:aurelia/core/localization/app_localization_extension.dart';
import 'package:aurelia/features/auth/logic/cubit/register_cubit.dart';
import 'package:aurelia/features/auth/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('register'))),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account created successfully. Please login.'),
              ),
            );

            Navigator.pushReplacementNamed(context, Routes.login);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: SingleChildScrollView(child: Column(children: [
              const SizedBox(height: 40),

              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: state is RegisterLoading
                    ? null
                    : () {
                  context.read<RegisterCubit>().register(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: state is RegisterLoading
                    ? const CircularProgressIndicator()
                    : Text(context.translate('register')),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(context.translate('backToLogin')),
              ),
            ])),
          );
        },
      ),
    );
  }
}
