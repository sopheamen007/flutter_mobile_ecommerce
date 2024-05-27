import 'package:flutter/material.dart';

class ButtonTextPlus extends StatelessWidget {
  
  final String label;
  final Color labelColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  const ButtonTextPlus({super.key, required this.label, required this.labelColor, this.backgroundColor, required this.onPressed,});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor?? Color(0xff5bbf80),
        borderRadius:BorderRadius.circular(13),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          // backgroundColor: WidgetStateProperty.all(Colors.transparent),
          // elevation: WidgetStateProperty.all(0), // Remove elevation
          // shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Text(label,
            style: TextStyle(color: labelColor, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

