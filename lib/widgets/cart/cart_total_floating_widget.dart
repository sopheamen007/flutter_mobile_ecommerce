import 'package:e_commerce_app/pages/check_out/check_out_page.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_solid.dart';
import 'package:flutter/material.dart';

class CartTotalFloatingWidget extends StatelessWidget {
  final double discountAmount;
  final double subtotal;
  final double delivery;
  final double total;

  const CartTotalFloatingWidget({super.key, required this.discountAmount, required this.subtotal, required this.delivery, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Color(0xfff8f9fe),
        height: 260,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.green,
            image: DecorationImage(
                image: AssetImage("assets/images/background_right.png"),
                fit: BoxFit.cover,
              ),
          ),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: meduimHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub-total:', style: subHeadline2.copyWith(color: appWhite),),
                  Text('\$${subtotal.toStringAsFixed(2)}',
                    style: subHeadline2.copyWith(color: appWhite)
                  ),
                ],
              ),
              SizedBox(height: verySmallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount (5%):', style: subHeadline2.copyWith(color: appWhite)),
                  Text('\$${discountAmount.toStringAsFixed(2)}',
                    style: subHeadline2.copyWith(color: appWhite)
                  ),
                ],
              ),
              SizedBox(height: verySmallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery:', style: subHeadline2.copyWith(color: appWhite)),
                  Text('\$${delivery.toStringAsFixed(2)}',
                    style: subHeadline2.copyWith(color: appWhite)
                  ),
                ],
              ),
              SizedBox(height: smallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: subHeadline2.copyWith(color: appWhite)),
                  Text('\$${total.toStringAsFixed(2)}',
                    style: subHeadline2.copyWith(color: appWhite)
                  ),
                ],
              ),
              SizedBox(height: meduimHeight),
              ButtonSolid(
                label: "Place My Order",
                labelColor: appSecondary,
                backgroundColor: appWhite,
                isFullWidth: true,
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CheckOutPage()),
                  );
                }
              ),
            ],
          ),
        ),
      );
  }
}