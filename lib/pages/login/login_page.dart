import 'package:e_commerce_app/pages/user/user_page.dart';
import 'package:e_commerce_app/pages/menu_api/menu_api_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: 'johndoe@gmail.com');
  final TextEditingController passwordController = TextEditingController(text: '12345678');
  final storage = FlutterSecureStorage();
  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password are required.');
      }

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      // print('Response Body: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body.trim());
        // final String? token = responseData['token'];
        final String? token = responseData['data']['token'];
        if (token != null && token.isNotEmpty) {
          await storage.write(key: 'token', value: token);
          // print('Token: $token'); // Debug
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserPage()),
          );
        } else {
          throw Exception('Token is null or empty.'); // Debug
        }
      } else {
        throw Exception('Login failed. Please check your credentials.');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () => login(emailController.text, passwordController.text),
              child: isLoading ? CircularProgressIndicator() : Text('Login'),
            ),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Go to login status"),
            )
          ],
        ),
      ),
    );
  }
}
