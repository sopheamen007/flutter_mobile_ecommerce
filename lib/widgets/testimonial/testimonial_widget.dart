import 'package:e_commerce_app/widgets/star_rating/star_rating.dart';
import 'package:flutter/material.dart';

class TestimonialWidget extends StatelessWidget {
  final int id;
  final String imagePath;
  final String fullName;
  final String comment;
  final String date;
  final double starRating;
  final VoidCallback onTap;

  const TestimonialWidget({
    Key? key,
    required this.id,
    required this.imagePath,
    required this.fullName,
    required this.comment,
    required this.date,
    required this.starRating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.2),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffff4f7fe), Colors.white],
        ),
      ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 210,
                    child: Text(
                      fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  StarRating(starRating: starRating),
                ],
              ),
              SizedBox(height: 5),
              Text(
                date, // Replace with actual date
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                comment,
                // Replace with actual description
              ),
            ],
          ),
        ),
      ),
    );
  }
}
