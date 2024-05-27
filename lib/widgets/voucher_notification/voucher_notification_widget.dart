import 'package:e_commerce_app/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/images/image_widget.dart';

class VoucherNotificationWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const VoucherNotificationWidget({
    Key? key,
    required this.imagePath,
    this.height, 
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.4),
        margin: EdgeInsets.symmetric(horizontal: 0.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              ImageWidget(imagePath: imagePath),
              SizedBox(width: smallWidth,),
              Text("You have 3 Vouchers",
                style: headline,
              ),
            ],
          ),
        ),
    );
  }
}
