import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/images/image_widget.dart';
import 'package:flutter/material.dart';

class RestaurantSquareWidget extends StatelessWidget {
  final int id;
  final String imagePath;
  final String name;
  final String totalMinutes;
  final double? height;
  final double? width;
  final VoidCallback onTap;

  const RestaurantSquareWidget({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.name, 
    required this.totalMinutes, 
    this.height, 
    this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidthPercentage = 0.43;
    return  GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.3),
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
        child: Container(
          width: screenWidth * cardWidthPercentage,
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffff5f6fe), Colors.white],
                ),
              ),
          child: Padding(
            padding: EdgeInsets.only(top: 25, bottom: 18),
            child: Column(
              children: [
                ImageWidget(imagePath: imagePath),
                SizedBox(height: 6),
                Text(name,
                  style: subHeadline2,
                ),
                SizedBox(height: 6),
                Text(totalMinutes,
                  style: subHeadline.copyWith(fontWeight: FontWeight.w500, color: appBlack.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}