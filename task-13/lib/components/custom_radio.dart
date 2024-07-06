import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final Widget title;
  final int value;
  final int groupValue;
  final Function(int value) onChanged;

  const CustomRadio({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: value == groupValue ? Border.all(width: 7, color: Colors.green) : Border.all(width: 2, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 16),
          title,
        ],
      ),
    );
  }
}