import 'package:flutter/material.dart';
import '/assets/app_colors.dart';

class PropertyItem extends StatelessWidget {
  String _title;
  String _value;
  Function()? _onPressed;

  PropertyItem({
    super.key,
    required String title,
    required String value,
    Function()? onPressed,
  })  : _title = title,
        _value = value,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.propertyItemColorLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_title),
                Text(_value),
              ],
            ),
          ),
          if (_onPressed != null)
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: _onPressed,
            ),
        ],
      ),
    );
  }
}