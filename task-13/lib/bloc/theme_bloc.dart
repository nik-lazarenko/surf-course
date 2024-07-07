import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  late SharedPreferences prefs;

  ThemeBloc() : super(ThemeInitial()) {
    _getPref();

    on<ThemeChanged>((event, emit) async {
      await prefs.setBool('isDark', event.isDark);

      emit(new ThemeChanges(event.isDark));
    });
  }

  void _getPref() async {
    prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDark') ?? false;
    emit(new ThemeChanges(isDark));
  }
}