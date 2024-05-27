import 'package:e_commerce_app/constant/env.dart';
import 'package:e_commerce_app/models/restaurant_model/restaurant_response.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RestaurantApiPage extends StatefulWidget {
  @override
  _RestaurantApiPageState createState() => _RestaurantApiPageState();
}

class _RestaurantApiPageState extends State<RestaurantApiPage> {
  List<RestaurantResponse> listRestaurants = [];
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future fetchRestaurants() async {
    try {
      final token = await storage.read(key: 'token');
     
      if (token == null) {
        throw Exception('No token found');
      }

      final response = await http.get(
        Uri.parse('${URL}restaurants'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        //
        List<RestaurantResponse> restaurants = data.map((json) => RestaurantResponse.fromJson(json)).toList();
        
        setState(() {
          listRestaurants = restaurants;
        });
        // return data.map((json) => RestaurantResponse.fromJson(json)).toList();
        // print(data);
      } else {
        print('Failed to load restaurants: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      // throw Exception('Error fetching users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Restaurant Display'),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return Column(
      children: List.generate(listRestaurants.length, (index) {
        final data = listRestaurants[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(data.profileImage),
          ),
          title: Text(data.name),
          subtitle: Text(data.email),
        );
      }),
    );
  }

}
