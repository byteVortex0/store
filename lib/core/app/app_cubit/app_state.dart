part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.changeThemeMode({required bool isDark}) =
      ChangeThemeModeState;
  const factory AppState.changeLanguage({required Locale locale}) =
      ChangeLanguageState;
}
