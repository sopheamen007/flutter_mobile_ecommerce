
import 'package:flutter/material.dart';

class ButtonFloating extends StatelessWidget {
  final String label;
  final Color labelColor;
  final bool? isMaxWidth;
  final VoidCallback onPressed;
  
  ButtonFloating({super.key, required this.label, required this.labelColor, this.isMaxWidth, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * (isMaxWidth ?? false ? 0.93 : 0.40);
    return Container(
      width: width,
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
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
          child: Text(label,
            style: TextStyle(color: labelColor, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

}