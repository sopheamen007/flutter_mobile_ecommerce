import 'package:e_commerce_app/pages/check_out/check_out_page.dart';
import 'package:e_commerce_app/widgets/cart/cart_total_floating_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_solid.dart';
import 'package:e_commerce_app/widgets/cart/cart_widget.dart';
import 'package:e_commerce_app/models/cart_model/cart_data.dart';
import 'package:e_commerce_app/models/cart_model/cart_response.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final filteredData = cartData.take(9).toList(); // Selecting 2 records
    double subtotal = 0.0;
    double delivery = 5.0; // Assuming a fixed delivery fee of $5.00
    double discount = 0.05; // 5% discount

    for (var cartItem in filteredData) {
      subtotal += cartItem.totalPrice;
    }

    double discountAmount = subtotal * discount;
    double discountedSubtotal = subtotal - discountAmount;
    double total = discountedSubtotal + delivery;

    return Scaffold(
      body: SingleChildScrollView(
        child: getBody(filteredData, total),
      ),
      floatingActionButton: CartTotalFloatingWidget(
        discountAmount: discount,
        subtotal: subtotal,
        delivery: delivery,
        total: total,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomSheet: getFooter(discountAmount, subtotal, delivery, total),
    );
  }

  Widget getBody(List<CartResponse> filteredData, double total) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff8f9fe),
        image:DecorationImage(
          image: AssetImage("assets/images/background_top_right.png"),
          alignment: Alignment.topCenter,
          scale: 0.3,
        ),
      ),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/back.png',
                width: 45,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Detail Orders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
              children: List.generate(filteredData.length, (index) {
                final cartItem = filteredData[index];
                return CartWidget(
                  imagePath: cartItem.menu.imageUrl, 
                  menu: cartItem.menu.name,
                  restaurant: cartItem.menu.restaurant.name,
                  quantity: cartItem.quantity, 
                  totalPrice: cartItem.totalPrice, 
                  onTap: (){
                    //
                  },
                );
              }),
          ),
        ],
      ),
    );
  }

  Widget getFooter(double discountAmount, double subtotal, double delivery, double total){
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
