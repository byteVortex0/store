import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/services/shared_pref/pref_keys.dart';

import '../../services/shared_pref/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;
  String currentLang = 'en';

  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(ChangeThemeModeState(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then(
            (value) => emit(
              ChangeThemeModeState(isDark: isDark),
            ),
          );
    }
  }



  void savedLanguage(){
    final result = SharedPref().containPreference(PrefKeys.language) ?
      SharedPref().getString(PrefKeys.language) : 'en';
      currentLang = result!;
      emit(ChangeLanguageState(locale: Locale(currentLang)));
  }

  Future<void> changeLang(String langCode) async{
    currentLang = langCode;
    await SharedPref().setString(PrefKeys.language, currentLang);
    emit(ChangeLanguageState(locale: Locale(currentLang)));
  }

  void toArabic() => changeLang('ar');

  void toEnglish() => changeLang('en');


}
