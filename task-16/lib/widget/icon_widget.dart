import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  final String image;
  final String text;
  final bool isActive;
  final VoidCallback? onTap;

  const CustomIcon({
    super.key,
    required this.image,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              color: isActive
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}