import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CartApiPage extends StatelessWidget {
  final int productId;
  final int quantity;

  CartApiPage({required this.productId, required this.quantity});

  final storage = FlutterSecureStorage();

  Future<void> addToCart() async {
    try {
      // Read token from secure storage
      final token = await storage.read(key: 'token');
      if (token == null) {
        throw Exception('No token found');
      }

      // Validate productId and quantity
      if (productId <= 0 || quantity <= 0) {
        throw Exception('Invalid productId or quantity');
      }

      // Send POST request to add product to cart
      final apiUrl = 'http://127.0.0.1:8000/api/addcart';
      final now = DateTime.now();
      final formattedNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'menu_id': 2,
          'user_id': 2,
          'quantity': 3,
          'total_price': 15,
          'created_at': formattedNow,
          'updated_at': formattedNow,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Product added to cart successfully
        print('Product added to cart');
      } else {
        // Error adding product to cart
        print('Failed to add product to cart: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => addToCart(), // Wrap in anonymous function
          child: Text('Add to Cart'),
        ),
      ),
    );
  }
}
