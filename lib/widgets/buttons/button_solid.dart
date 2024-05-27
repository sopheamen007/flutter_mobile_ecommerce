import 'package:flutter/material.dart';

class ButtonSolid extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color? backgroundColor;
  final bool? isFullWidth;
  final VoidCallback onPressed;

  const ButtonSolid({super.key, required this.label, required this.labelColor, this.backgroundColor, this.isFullWidth, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: isFullWidth ?? false ? double.infinity : null,
      decoration: BoxDecoration(
        color: backgroundColor?? Color(0xff5bbf80),
        borderRadius:BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // backgroundColor: WidgetStateProperty.all(Colors.transparent),
          // elevation: WidgetStateProperty.all(0), // Remove elevation
          // shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Text(label,
            style: TextStyle(color: labelColor, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
  
}