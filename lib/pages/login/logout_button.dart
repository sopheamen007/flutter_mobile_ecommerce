import 'package:e_commerce_app/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import your login page file

class LogoutButton extends StatelessWidget {
  final storage = FlutterSecureStorage();

  Future<void> _logout(BuildContext context) async {
    await storage.delete(key: 'token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login page after logout
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout),
      onPressed: () => _logout(context), // Call _logout function when button is pressed
    );
  }
}
