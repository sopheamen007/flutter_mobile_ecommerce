import 'package:e_commerce_app/themes/styles.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bigPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getHeader(),
              SizedBox(height: 20),
              getPromo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPromo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/promos/promo_1.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: meduimHeight,
          ),
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/promos/promo_2.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
            'Voucher Promo',
            style: appTitle,
          ),
        ),
      ],
    );
  }
}
