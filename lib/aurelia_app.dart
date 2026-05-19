import 'package:aurelia/core/routing/app_router.dart';
import 'package:aurelia/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/routing/routes.dart';

class AureliaApp extends StatelessWidget {
  AureliaApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aurelia',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.splash,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
