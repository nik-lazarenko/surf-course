import 'package:flutter/material.dart';
import '/screens/registration_screen.dart';
import '/utils/custom_theme_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Validation form',
  theme: appTheme,
  home: const RegistrationScreen(),
  );
  }
  }