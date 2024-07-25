import 'package:flutter/material.dart';
import '../assets/text_strings.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.emptyScreen),
    );
  }
}