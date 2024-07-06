import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/data/repository/shopping_list_repository.dart';
import 'package:surf_flutter_courses_template/presentation/tabs_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) => runApp(const MyApp()),
  );
}

final shoppingListRepository = ShoppingListRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const TabsScreen(),
    );
  }
}
