import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {

  static TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);

  static TextStyle title = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, height: 1.33));

  static TextStyle appBarDate = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, height: 1.6));

  static TextStyle textProduct = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, height: 1.3));

  static TextStyle textBoldProduct = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700, height: 1.3));

  static TextStyle total = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, height: 1.5));

  static TextStyle sort = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, height: 1.2));

  static TextStyle navBar = GoogleFonts.sora(
      textStyle: const TextStyle(
          fontSize: 10, fontWeight: FontWeight.w600, height: 1.26));
}