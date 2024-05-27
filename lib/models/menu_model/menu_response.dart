import 'dart:core';
import 'package:e_commerce_app/models/restaurant_model/restaurant_response.dart';

class MenuResponse {
  final int id;
  final RestaurantResponse restaurant;
  final String name;
  final String description;
  final double price;
  final String foodType;  // Cake, Soup, Main Course, Appetizer, Desert
  final String imageUrl;
  final bool isAvailable;

  MenuResponse({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.description,
    required this.price,
    required this.foodType,
    required this.imageUrl,
    required this.isAvailable,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) {
    return MenuResponse(
      id: json['id'],
      restaurant: RestaurantResponse.fromJson(json['restaurant']),
      name: json['name'],
      description: json['description'],
      price: 12.99,
      // price: (json['price'] as num).toDouble(),
      foodType: json['food_type'],
      imageUrl: json['image_url'],
      isAvailable: json['is_available'],
    );
  }

}
