import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aurelia Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.dark);
              },
              child: const Text('Dark Mode'),
            ),ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.light);
              },
              child: const Text('Light Mode'),
            ),ElevatedButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme(ThemeMode.system);
              },
              child: const Text('System Mode'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('ar');
              },
              child: const Text('Arabic'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('en');
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
