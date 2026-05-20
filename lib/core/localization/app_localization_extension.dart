import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_strings.dart';
import 'locale_cubit.dart';

extension AppLocalizationExtension on BuildContext {
  String translate(String key) {
    final languageCode = read<LocaleCubit>().state.languageCode;

    return AppStrings.translate(key, languageCode);
  }
}