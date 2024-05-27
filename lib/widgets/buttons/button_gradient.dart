import 'package:flutter/material.dart';

class ButtonGradient extends StatelessWidget {
  final String label;
  final Color labelColor;
  final bool? isFullWidth;
  final VoidCallback onPressed;

  const ButtonGradient({super.key, required this.label, required this.labelColor, this.isFullWidth, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ?? false ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:  [Color(0xff7ce192), Color(0xff5bbf80), Color(0xff5bbf80)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius:BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0), // Remove elevation
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Text(label,
            style: TextStyle(color: labelColor, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}