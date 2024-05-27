import 'package:flutter/material.dart';

class ProfilePictureGradient extends StatelessWidget {
  final String imageUrl;
  final double? imageSize;

  const ProfilePictureGradient({
    Key? key,
    required this.imageUrl,
    this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize != null ? (imageSize! + 4) : 80,
      height: imageSize != null ? (imageSize! + 4) : 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.transparent, width: 2.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pink,
            Colors.orange,
            Colors.yellow,
            Colors.blue,
            Colors.purple,
          ],
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: imageSize != null ? ((imageSize! + 4) / 2 - 2) : 51,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
