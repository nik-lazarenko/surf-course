

import 'package:flutter/material.dart';

extension StringX on String {
  Color hexToColor() {
    final hexCode = replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
  }
}