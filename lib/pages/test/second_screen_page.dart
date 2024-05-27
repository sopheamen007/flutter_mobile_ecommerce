import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pop the current screen and pass a value back
            Navigator.pop(context, 'Hello from Second Screen');
          },
          child: Text('Go Back with Value'),
        ),
      ),
    );
  }
}
