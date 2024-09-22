import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import '/data/repository/shopping_list_repository.dart';
import '/screens/navbar_screen.dart';
import 'assets/colors.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then((_) {
    runApp(const MyApp());
  });
}

final shoppingListRepository = ShoppingListRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.brightGreen),
      home: const NavBarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}