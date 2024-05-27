import 'package:e_commerce_app/pages/login/login_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_gradient.dart';
import 'package:flutter/material.dart';

class Welcome3Page extends StatelessWidget {
  const Welcome3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/welcome3_image.png"),
          SizedBox(height: meduimHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: veryBigPadding),
            child: Text("Food Ninja is Where Your Comfort Food Lives",
              style: appTitle,
              maxLines: null,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: smallHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: veryBigPadding+40),
            child: Text("Enjoy a fast and smooth food delivery at your doorstep",
              style: body,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: bigHeight),
        ],
      ),
      bottomSheet: getFooter(context),
    );
  }


  Widget getFooter(context){
    return Container(
      color: Color(0xfffdf7fe),
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 90),
      child: ButtonGradient(
        label: "Next", 
        labelColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      ),
    );
  }

}