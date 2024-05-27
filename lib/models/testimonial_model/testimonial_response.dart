
import 'package:e_commerce_app/models/user_model/user_response.dart';

class TestimonialResponse {
  final int id;
  final UserResponse user;
  final String name;
  final double price;
  final String comment;
  final String date;
  final int numberOfRates;
  final double starRating;
  final String photoUrl;

  TestimonialResponse({
    required this.id,
    required this.user,
    required this.name,
    required this.price,
    required this.comment,
    required this.date,
    required this.numberOfRates,
    required this.starRating,
    required this.photoUrl,
  });
}