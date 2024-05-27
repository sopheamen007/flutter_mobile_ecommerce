import 'package:e_commerce_app/pages/test/second_screen_page.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to the second screen and wait for a result
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
            setState(() {
              value = result;
            });

            // Display the result using a snackbar
            ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Received: $result")));
          },
          child: Column(
            children: [
              Text('Go to Second Screen'),
              Text("New value ${value}")
            ],
          ),
        ),
      ),
    );
  }
}