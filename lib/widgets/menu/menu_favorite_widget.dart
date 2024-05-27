import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_small_gradient.dart';
import 'package:e_commerce_app/widgets/images/image_widget.dart';
import 'package:flutter/material.dart';

class MenuFavoriteWidget extends StatelessWidget {
  final int? id;
  final String imagePath;
  final String name;
  final String restaurant;
  final double price;
  final VoidCallback onTap;

  const MenuFavoriteWidget({
    Key? key,
    this.id,
    required this.imagePath,
    required this.name,
    required this.restaurant,
    required this.price, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: ListTile(
          onTap: onTap,
          leading: ImageWidget(imagePath: imagePath),
          title: Text(name,
            style: subHeadline,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant,
                style: subHeadline2.copyWith(color: appBlack.withOpacity(0.3), fontWeight: FontWeight.w600),
              ),
              Text('\$${price.toInt()}',
                style: title3.copyWith(color: appSecondary, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          trailing: ButtonSmallGradient(
            label: "Buy Again", 
            labelColor: Colors.white, 
            onPressed: (){
              //
            }
          ),
        ),
      ),
    );
  }


}