import 'package:flutter/material.dart';

class ButtonSmallGradient extends StatelessWidget {
  final String label;
  final Color labelColor;
  final bool? isFullWidth;
  final VoidCallback onPressed;

  const ButtonSmallGradient({super.key, required this.label, required this.labelColor, this.isFullWidth, required this.onPressed});

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
        borderRadius:BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: 35,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 18),
            ),
          ),
          child: Text(label,
            style: TextStyle(color: labelColor, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}