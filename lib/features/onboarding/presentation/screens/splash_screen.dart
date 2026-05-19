import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Routes.login);
    });
    return const Scaffold(
      body: Center(
        child: Text('Aurelia'),
      ),
    );
  }
}