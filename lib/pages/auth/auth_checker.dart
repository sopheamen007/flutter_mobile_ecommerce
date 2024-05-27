import 'package:e_commerce_app/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthChecker extends StatefulWidget {
  final Widget child;

  AuthChecker({required this.child});

  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  final storage = FlutterSecureStorage();
  late Future<String?> _getToken;

  @override
  void initState() {
    super.initState();
    _getToken = storage.read(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getToken,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return widget.child;
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
