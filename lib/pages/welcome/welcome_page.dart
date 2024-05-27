import 'package:e_commerce_app/pages/welcome/welcome2_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome2Page()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage("assets/images/background.png"),
              alignment: Alignment.topCenter,
              scale: 0.3,
            ),
          ),
          child: Center(
            child: Image.asset("assets/images/logo.png", height: 200,),
          ),
        ),
      ),
    );
  }
  
}