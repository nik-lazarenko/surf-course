part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  ThemeMode mode = ThemeMode.dark;
}

final class ThemeInitial extends ThemeState {}

final class ThemeChanges extends ThemeState {
  ThemeChanges(bool isDark) {
    if (isDark)
      mode = ThemeMode.dark;
    else
      mode = ThemeMode.light;
  }
}