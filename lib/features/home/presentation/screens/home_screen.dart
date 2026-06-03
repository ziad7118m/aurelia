import 'package:aurelia/core/cache/secure_storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/localization/app_localization_extension.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translate('home'))),
      body: Center(
        child: Column(
          spacing: 5,
          children: [
            ElevatedButton(
              onPressed: () async{
                await SecureStorageHelper.clearTokens();
                if(!context.mounted) return ;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              },
              child: Text(context.translate('logout')),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
              },
              child: Text(context.translate('darkMode')),
            ),ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.light);
              },
              child: Text(context.translate('lightMode')),
            ),ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.system);
              },
              child:  Text(context.translate('systemMode')),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('ar');
              },
              child: Text(context.translate('arabic')),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('en');
              },
              child: Text(context.translate('english')),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              },
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}