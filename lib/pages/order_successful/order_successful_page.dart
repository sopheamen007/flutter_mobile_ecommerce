import 'package:e_commerce_app/pages/home/home_page.dart';
import 'package:e_commerce_app/pages/welcome/welcome2_page.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_floating.dart';
import 'package:flutter/material.dart';

class OrderSuccessfulPage extends StatefulWidget {
  const OrderSuccessfulPage({super.key});

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2000000000), () {
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
        child: getBody(),
      ),
      floatingActionButton: getButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getButton(BuildContext context) {
    return ButtonFloating(
      label: "Check Out",
      labelColor: appWhite,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }

  Widget getBody() {
    return Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/images/background.png"),
            alignment: Alignment.topCenter,
            scale: 0.3,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/success.png"),
              SizedBox(height: 50),
              Text("Great!",
                style: bigTitle.copyWith(color: appSecondary),
              ),
              SizedBox(height: 15),
              Text("Your Order Is Complete.",
                style: title3.copyWith(color: appBlack.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      );
  }


}