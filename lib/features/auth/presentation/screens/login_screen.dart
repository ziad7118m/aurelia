import 'package:aurelia/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localization_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('login'))),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              child: const Text('Go to Home'),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              child: Text(context.translate('createAccount')),
            ),
          ],
        ),
      ),
    );
  }
}