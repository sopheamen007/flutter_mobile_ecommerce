import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/images/image_widget.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  // final int? id;
  final String imagePath;
  final String menu;
  final String restaurant;
  final int quantity;
  final double totalPrice;
  final VoidCallback onTap;

  const CartWidget({
    Key? key,
    //  this.id,
    required this.imagePath,
    required this.menu,
    required this.restaurant,
    required this.quantity,
    required this.totalPrice, 
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageWidget(imagePath: imagePath),
            SizedBox(width: meduimWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(menu,
                    style: subHeadline,
                  ),
                  SizedBox(height: 3),
                  Text(restaurant,
                    style: subHeadline2.copyWith(color: appBlack.withOpacity(0.4), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(totalPrice.toString(),
                    style: headline.copyWith(color: appSecondary),
                  ),
                ],
              ),
            ),
            Container(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/minus.png"),
                  SizedBox(width: smallWidth),
                  Text("1", style: subHeadline,),
                  SizedBox(width: smallWidth),
                  Image.asset("assets/icons/plus.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}