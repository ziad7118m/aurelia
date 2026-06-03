import 'package:flutter/material.dart';
import '../../../../core/cache/secure_storage_helper.dart';
import '../../../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Aurelia'),
      ),
    );
  }

  Future<void> _checkLoginStatus()async {
    await Future.delayed(const Duration(seconds: 2));
    final accessToken = await SecureStorageHelper.getAccessToken();
    if (!mounted) return ;
    if(accessToken == null || accessToken.isEmpty){
      Navigator.pushReplacementNamed(context, Routes.login);
    }else {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }
}