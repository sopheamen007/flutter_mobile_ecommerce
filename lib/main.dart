import 'package:e_commerce_app/pages/menu/menu_page.dart';
import 'package:e_commerce_app/pages/restaurant/restaurant_api_page.dart';
import 'package:e_commerce_app/pages/user/user_page.dart';
import 'package:e_commerce_app/pages/login/login_page.dart';
import 'package:e_commerce_app/pages/menu_api/menu_api_page.dart';
import 'package:e_commerce_app/pages/rating_food/rating_food_page.dart';
import 'package:e_commerce_app/pages/root_app/root_app.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      home: MenuApiPage(),
      // home: MenuApiPage(),
      // home: UserPage(),
    );
  }
}
