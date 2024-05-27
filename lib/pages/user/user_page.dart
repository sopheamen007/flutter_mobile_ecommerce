import 'package:e_commerce_app/constant/env.dart';
import 'package:e_commerce_app/models/user_model/user_response.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserResponse> listUsers = [];
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
        Uri.parse('${URL}users'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        //
        List<UserResponse> users = data.map((json) => UserResponse.fromJson(json)).toList();
        
        setState(() {
          listUsers = users;
        });
        // return data.map((json) => UserResponse.fromJson(json)).toList();
        // print(data);
      } else {
        print('Failed to load users: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error fetching users: $e');
      // throw Exception('Error fetching users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API User Display'),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    return Column(
      children: List.generate(listUsers.length, (index) {
        final data = listUsers[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(data.profileImage),
          ),
          title: Text(data.fullName),
          subtitle: Text(data.email),
        );
      }),
    );
  }

}
