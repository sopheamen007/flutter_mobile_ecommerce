import 'package:e_commerce_app/constant/env.dart';
import 'package:e_commerce_app/models/menu_model/menu_response.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MenuApiPage extends StatefulWidget {
  @override
  _MenuApiPageState createState() => _MenuApiPageState();
}

class _MenuApiPageState extends State<MenuApiPage> {
  List<MenuResponse> ListMenus = [];
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future fetchUsers() async {
    try {
      final token = await storage.read(key: 'token');
     
      if (token == null) {
        throw Exception('No token found');
      }

      final response = await http.get(
        Uri.parse('${URL}menus'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        //
        List<MenuResponse> menus = data.map((json) => MenuResponse.fromJson(json)).toList();
        
        setState(() {
          ListMenus = menus;
        });
        // return data.map((json) => MenuResponse.fromJson(json)).toList();
        // print(data);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Menu Display'),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return Column(
      children: List.generate(ListMenus.length, (index) {
        final data = ListMenus[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(data.imageUrl),
          ),
          title: Text(data.name),
          subtitle: Text(data.restaurant.name),
        );
      }),
    );
  }

}
