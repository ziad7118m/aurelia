import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cache/shared_pref_helper.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  Future<void> loadSavedLocale() async {
    final savedLanguageCode = await SharedPrefHelper.getLanguageCode();

    emit(Locale(savedLanguageCode));
  }

  Future<void> changeLanguage(String languageCode) async {
    await SharedPrefHelper.saveLanguageCode(languageCode);

    emit(Locale(languageCode));
  }
}