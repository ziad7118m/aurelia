import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aurelia Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
                  (route) => false,
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}