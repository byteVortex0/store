import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/services/shared_pref/pref_key.dart';

import '../../services/shared_pref/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;

  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(ThemeChangeModeState(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKey.themeMode, isDark).then(
            (value) => emit(
              ThemeChangeModeState(isDark: isDark),
            ),
          );
    }
  }
}
