import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String imageURL;
  final double? imageSize;
  final Color? borderColor;

  const ProfilePicture({
    Key? key,
    required this.imageURL,
    this.imageSize,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize != null ? imageSize : 100,
      height: imageSize != null ? imageSize : 100,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Colors.white.withOpacity(0.5), // Use red border if borderColor is not provided
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageURL),
      ),
    );
  }
}
