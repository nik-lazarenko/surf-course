import 'package:flutter/material.dart';
import '/data/repository/photos_repository.dart';
import '/presentation/photos_screen.dart';

void main() {
  runApp(const MainApp());
}

final photosRepository = PhotosRepository();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Постограмм',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: const PhotosScreen(),
    );
  }
}