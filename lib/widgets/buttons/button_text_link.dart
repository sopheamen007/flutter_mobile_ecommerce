import 'package:flutter/material.dart';

class TextButtonLink extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final VoidCallback onPressed;

  const TextButtonLink({super.key, required this.label, this.labelColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor?? Colors.green,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}