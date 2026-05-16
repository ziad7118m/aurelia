import 'package:aurelia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AureliaApp extends StatelessWidget {
  const AureliaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aurelia',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Text('Aurelia'),
      )
    );
  }
}
