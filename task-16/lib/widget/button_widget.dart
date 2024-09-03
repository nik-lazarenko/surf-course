import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 56),
          textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
          'Отправить',
        ),
      ),
    );
  }
}