import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  ImageWidget({required this.imagePath, this.width = 60.0, this.height = 60.0});

  @override
  Widget build(BuildContext context) {
    
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
      );
    }
  }
}
