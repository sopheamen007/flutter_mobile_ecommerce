import 'package:e_commerce_app/pages/order_successful/order_successful_page.dart';
import 'package:e_commerce_app/widgets/buttons/button_floating.dart';
import 'package:e_commerce_app/widgets/search_form/search_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/widgets/cart/cart_widget.dart';
import 'package:e_commerce_app/models/cart_model/cart_data.dart';
import 'package:e_commerce_app/models/cart_model/cart_response.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  List<CartResponse> filteredData = cartData; // Initialize with all menu data
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterData);
  }

  void _filterData() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredData = cartData;
      } else {
        final keywords = query.split(' ');
        filteredData = cartData.where((search) {
          return keywords.every((keyword) => search.menu.name.toLowerCase().contains(keyword));
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterData);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: getBody()),
      floatingActionButton: ButtonFloating(
        label: "Check Out",
        labelColor: appWhite,
        isMaxWidth: true,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OrderSuccessfulPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff8f9fe),
        image: DecorationImage(
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
          getHeader(),
          SizedBox(height: 20),
          getForm(),
          SizedBox(height: 25),
          getCard(),
        ],
      ),
    );
  }

  Widget getCard() {
    if (filteredData.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'No menu items found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }
    return Column(
      children: List.generate(filteredData.length, (index) {
        final cartItem = filteredData[index];
        return CartWidget(
          imagePath: cartItem.menu.imageUrl,
          menu: cartItem.menu.name,
          restaurant: cartItem.menu.restaurant.name,
          quantity: cartItem.quantity,
          totalPrice: cartItem.totalPrice,
          onTap: () {
            //
          },
        );
      }),
    );
  }

  Widget getForm() {
    return SearchFormWidget(searchController: searchController);
  }

  Widget getHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Find Your Favorite Food",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 30),
        Image.asset("assets/icons/notification.png"),
      ],
    );
  }



}
