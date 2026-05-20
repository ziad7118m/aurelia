import 'package:aurelia/core/routing/app_router.dart';
import 'package:aurelia/core/theme/app_theme.dart';
import 'package:aurelia/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/routes.dart';

class AureliaApp extends StatelessWidget {
  AureliaApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..loadSavedTheme(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aurelia',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            initialRoute: Routes.splash,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
