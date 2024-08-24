import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/theme_bloc.dart';
import '/components/custom_radio.dart';

class ThemePicker extends StatefulWidget {
  const ThemePicker({super.key});

  @override
  State<ThemePicker> createState() => _ThemePickerState();
}

class _ThemePickerState extends State<ThemePicker> {
  int _sortValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Тема оформления"),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            CustomRadio(
              title: Text("Системная"),
              value: 0,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
              },
            ),
            CustomRadio(
              title: Text("Светлая"),
              value: 1,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
                context.read<ThemeBloc>().add(ThemeChanged(false));
              },
            ),
            CustomRadio(
              title: Text("Темная"),
              value: 2,
              groupValue: _sortValue,
              onChanged: (value) {
                setState(() {
                  _sortValue = value;
                });
                context.read<ThemeBloc>().add(ThemeChanged(true));
              },
            ),
          ],
        ),
      ),
    );
  }
}