import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cache/shared_pref_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  Future<void> loadSavedTheme() async {
    final savedTheme = await SharedPrefHelper.getThemeMode();

    switch (savedTheme) {
      case 'light':
        emit(ThemeMode.light);
        break;

      case 'dark':
        emit(ThemeMode.dark);
        break;

      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    emit(themeMode);

    switch (themeMode) {
      case ThemeMode.light:
        await SharedPrefHelper.saveThemeMode('light');
        break;

      case ThemeMode.dark:
        await SharedPrefHelper.saveThemeMode('dark');
        break;

      case ThemeMode.system:
        await SharedPrefHelper.saveThemeMode('system');
        break;
    }
  }
}