import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(
    {required BuildContext context, }) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime.now(),
  );
}