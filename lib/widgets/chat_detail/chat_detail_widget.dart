import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/images/image_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailWidget extends StatelessWidget {
  // final int? id;
  final String imagePath;
  final String fullName;
  final bool onlineStatus;
  final VoidCallback onTap;

  const ChatDetailWidget({
    Key? key,
    //  this.id,
    required this.imagePath,
    required this.fullName,
    required this.onlineStatus,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      color: appWhite,
      margin: EdgeInsets.symmetric(vertical: 5.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff8f9fe), Colors.white, Colors.white], // Set your gradient colors
            begin: Alignment.topCenter, // Set the start point of the gradient
            end: Alignment.bottomCenter, // Set the end point of the gradient
          ),
          borderRadius: BorderRadius.circular(25.0), // Set the border radius
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageWidget(imagePath: imagePath),
            SizedBox(width: meduimWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullName,
                    style: subHeadline,
                  ),
                  SizedBox(height: 3),
                  onlineStatus
                  ? Row(
                    children: [
                      Image.asset("assets/icons/ellipse-online.png"),
                      Text(" Online",
                        style: subHeadline2.copyWith(color: appBlack.withOpacity(0.4), fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Image.asset("assets/icons/ellipse-offline.png"),
                      Text(" Offline",
                        style: subHeadline2.copyWith(color: appBlack.withOpacity(0.4), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onlineStatus
            ? Image.asset("assets/icons/call_online.png")
            : Image.asset("assets/icons/call_offline.png")
          ],
        ),
      ),
    );
  }


}