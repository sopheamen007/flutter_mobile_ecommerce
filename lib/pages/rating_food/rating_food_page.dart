import 'package:e_commerce_app/pages/welcome/welcome2_page.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_skip.dart';
import 'package:e_commerce_app/widgets/profile_picture/profile_picture.dart';
import 'package:e_commerce_app/widgets/star_rating/star_rating.dart';
import 'package:flutter/material.dart';

class RatingFoodPage extends StatefulWidget {
  const RatingFoodPage({super.key});

  @override
  State<RatingFoodPage> createState() => _RatingFoodPageState();
}

class _RatingFoodPageState extends State<RatingFoodPage> {
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
      // floatingActionButton: getButton(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  Widget getBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          alignment: Alignment.topCenter,
          scale: 0.3,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ProfilePicture(
              imageURL: 'assets/menus/menu_pic_1.png',
              imageSize: 200,
              borderColor: appSecondary),
            SizedBox(height: 50),
            Text(
              "Thank You! Enjoy Your Meal",
              style: bigTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "Your Order Is Complete.",
              style: subHeadline.copyWith(color: appBlack.withOpacity(0.4)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            getButton(context),
          ],
        ),
      ),
    );
  }

  Widget getButton(context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter text',
              prefixIcon: Icon(Icons.edit),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ButtonSkip(
            label: "Submit", 
            labelColor: appWhite, 
            onPressed: (){
          
            }, 
            onPressedSkip: (){
          
            }
          ),
        ],
      ),
    );
  }

}
