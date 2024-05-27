import 'package:e_commerce_app/models/menu_model/menu_response.dart';
import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_gradient.dart';
import 'package:flutter/material.dart';

class MenuDetailWidget extends StatefulWidget {
  final MenuResponse menu;

  MenuDetailWidget({required this.menu});

  @override
  _MenuDetailWidgetState createState() => _MenuDetailWidgetState();
}

class _MenuDetailWidgetState extends State<MenuDetailWidget> {
  int quantity = 1; // Initial quantity

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: body.copyWith(fontWeight: FontWeight.w100,),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: bigPadding),
                color: Colors.amber,
                child: Center(
                  child: Image.asset(
                    widget.menu.imageUrl, height: 220,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: bigPadding),
                child: Text(widget.menu.name,
                  style: title2,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: bigPadding),
                child: Text(widget.menu.description,
                  style: subHeadline2.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: bigPadding),
                child: Text("\$"+widget.menu.price.toStringAsFixed(2),
                  style: subHeadline2.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  ButtonGradient(
                    label: "Add to Cart",
                    labelColor: Colors.white,
                    onPressed: () {
                      _addToCart(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.cancel, color: Colors.black, size: 40), // Increased the size of the icon
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

void _addToCart(BuildContext context) {
  print('Item successfully added to cart!');
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CartPage(), // Remove the cartData argument from here
    ),
  );
}





}
