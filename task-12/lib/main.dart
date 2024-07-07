import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/api/service/colors_api_assets.dart';
import 'package:surf_flutter_courses_template/data/mapper/color_mapper.dart';
import 'package:surf_flutter_courses_template/presentation/colors_screen.dart';

import 'data/repository/colors_repository.dart';

void main() {
  runApp(const MainApp());
}

final colorsRepository = ColorsRepository(
  colorsApi: ColorsApiAssets(),
  colorsMapper: ColorMapper(),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palitra tsvetov',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorsScreen(),
        );
  }
}
