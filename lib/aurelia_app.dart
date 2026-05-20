import 'package:aurelia/core/localization/locale_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()..loadSavedTheme()),
        BlocProvider(create: (context) => LocaleCubit()..loadSavedLocale()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Aurelia',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                locale: locale,
                builder: (context, child) {
                  return Directionality(
                    textDirection: locale.languageCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: child!,
                  );
                },
                initialRoute: Routes.splash,
                onGenerateRoute: appRouter.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
