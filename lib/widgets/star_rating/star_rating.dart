import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class StarRating extends StatelessWidget {
  final double starRating;

  const StarRating({Key? key, required this.starRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: starRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 16,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

