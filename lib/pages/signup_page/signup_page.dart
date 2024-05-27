import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    final String url = 'http://127.0.0.1:8000/api/register';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      // Registration successful
      print('User registered successfully');
    } else {
      // Registration failed
      print('Failed to register user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
