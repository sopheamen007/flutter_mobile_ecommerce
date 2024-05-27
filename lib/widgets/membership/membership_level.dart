import 'package:flutter/material.dart';

class MembershipLevelLabel extends StatelessWidget {
  final String membershipLevel;
  
  const MembershipLevelLabel({Key? key, required this.membershipLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    String labelText;
    Color labelColr;

    switch (membershipLevel) {
      case 'Gold':
        color = Color(0xffffcf0d2);
        labelText = 'Member Gold';
        labelColr = Color(0xffffaaf30);
        break;
      case 'Silver':
        color = Colors.grey;
        labelText = 'Member Silver';
        labelColr = Color(0xffffcf0d2);
        break;
      case 'Bronze':
        color = Colors.brown;
        labelText = 'Member Bronze';
        labelColr = Color(0xffffcf0d2);
        break;
      default:
        color = Colors.black;
        labelText = 'Member Standard';
        labelColr = Color(0xffffcf0d2);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        labelText,
        style: TextStyle(
          color: labelColr,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
