import 'dart:convert';
import 'package:e_commerce_app/constant/env.dart';
import 'package:e_commerce_app/models/menu_model/menu_response.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/menu/menu_widget.dart';
import 'package:e_commerce_app/widgets/menu_detail/menu_detail_widget.dart';
import 'package:e_commerce_app/widgets/search_form/search_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List<MenuResponse> listMenu = [];
  final storage = FlutterSecureStorage();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMenu();
    // searchController.addListener(_filterData);
  }

  Future fetchMenu() async {
    try {
      final token = await storage.read(key: 'token');
     
      if (token == null) {
        throw Exception('No token found');
      }

      final response = await http.get(
        Uri.parse('${URL}users'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        //
        List<MenuResponse> menus = data.map((json) => MenuResponse.fromJson(json)).toList();
        
        setState(() {
          listMenu = menus;
        });

      } else {
        print('Failed to load menus: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load menus');
      }
    } catch (e) {
      print('Error fetching menus: $e');
      // throw Exception('Error fetching menus');
    }
  }

  @override
  void dispose() {
    // searchController.removeListener(_filterData);
    searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bigPadding),
          child: Column(
            children: [
              SizedBox(height: 80),
              // getHeader(),
              SizedBox(height: 20),
              getForm(),
              SizedBox(height: 40),
              // getMenu(),
            ],
          ),
        ),
      ),
    );
  }
  

  Widget getMenu() {
    if (listMenu.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'No menu found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }
    return Column(
      children: List.generate(listMenu.length, (index) {
        final menuItem = listMenu[index];
        return MenuWidget(
          imagePath: menuItem.imageUrl,
          restaurant: menuItem.restaurant.name,
          name: menuItem.name,
          price: menuItem.price,
          onTap: () {
            showMenuDetail(menuItem);
          },
        );
      }),
    );
  }

  
  void showMenuDetail(menu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Transform.translate(
          offset: Offset(0.0, 33.0), // Apply margin-bottom: -33px
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              child: Container(
                color: Colors.white,
                child: MenuDetailWidget(menu: menu),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget getForm() {
    return SearchFormWidget(searchController: searchController);
  }


  Widget getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/back.png',
            width: 45,
          ),
        ),
        SizedBox(height: meduimHeight,),
        Row(
          children: [
            Expanded(
              child: Text(
                "Find Your Favorite Food",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 30),
            Image.asset("assets/icons/notification.png"),
          ],
        ),
      ],
    );
  }
}
