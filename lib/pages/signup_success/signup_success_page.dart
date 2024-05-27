import 'package:e_commerce_app/pages/root_app/root_app.dart';
import 'package:e_commerce_app/pages/welcome/welcome2_page.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_gradient.dart';
import 'package:flutter/material.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({super.key});

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
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
      bottomSheet: getFooter(),
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
              Text("Congrats!",
                style: bigTitle.copyWith(color: appSecondary),
              ),
              SizedBox(height: 15),
              Text("Your Profile Is Ready To Use",
                style: title3.copyWith(color: appBlack.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      );
  }

  Widget getFooter(){
    return Container(
      color: Color(0xfffdf7fe),
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 90),
      child: ButtonGradient(
        label: "Try Order", 
        labelColor: Colors.white,
        onPressed: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RootApp()),
          );
        }
      ),
    );
  }


}