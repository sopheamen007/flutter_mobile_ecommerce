
import 'package:e_commerce_app/themes/colors.dart';
import 'package:flutter/material.dart';

class ButtonSkip extends StatelessWidget {
  final String label;
  final Color labelColor;
  final bool? isMaxWidth;
  final VoidCallback onPressed;
  final VoidCallback onPressedSkip;
  
  ButtonSkip({super.key, required this.label, required this.labelColor, this.isMaxWidth, required this.onPressed, required this.onPressedSkip});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * (isMaxWidth ?? false ? 0.93 : 0.40);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Container(
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
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              onPressed: onPressedSkip,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0), // Remove elevation
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                child: Text("Skip",
                  style: TextStyle(color: appSecondary, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}