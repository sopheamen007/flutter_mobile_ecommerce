import 'package:e_commerce_app/pages/welcome/welcome3_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_gradient.dart';
import 'package:flutter/material.dart';

class Welcome2Page extends StatelessWidget {
  const Welcome2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/welcome2_image.png"),
          SizedBox(height: smallHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: veryBigPadding+50),
            child: Text("Find your comfort food here",
              style: appTitle,
              maxLines: null,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: smallHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: veryBigPadding+50),
            child: Text("Here You Can find a chef or dish for every taste and color. Enjoy!",
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
            context, MaterialPageRoute(builder: (context) => Welcome3Page()),
          );
        }
      ),
    );
  }

}