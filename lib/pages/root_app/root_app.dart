import 'package:e_commerce_app/pages/account/account_page.dart';
import 'package:e_commerce_app/pages/cart/cart_page.dart';
import 'package:e_commerce_app/pages/chat/chat_page.dart';
import 'package:e_commerce_app/pages/home/home_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: indexTab,
      children: [
        HomePage(),
        AccountPage(),
        CartPage(),
        ChatPage(),
      ],
    );
  }

  Widget getFooter(){
    List widgetIcons = [
      'assets/icons/home.svg',
      'assets/icons/person.svg',
      'assets/icons/cart.svg',
      'assets/icons/chat-round.svg'
    ];
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: bigPadding, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widgetIcons.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexTab = index;
              });
            },
            child: SvgPicture.asset(widgetIcons[index], color: Colors.green,
              height: index == 1 ? 20 : 30,
            )
          );
        }),
        // children: [
        //   GestureDetector(
        //     onTap: () {
        //       setState(() {
        //         indexTab = 0;
        //       });
        //     },
        //     child: SvgPicture.asset('assets/icons/home.svg', color: Colors.green)
        //   ),
        //   SvgPicture.asset('assets/icons/person.svg', color: Colors.green, height: 20,),
        //   SvgPicture.asset('assets/icons/cart.svg', color: Colors.green),
        //   SvgPicture.asset('assets/icons/chat-round.svg', color: Colors.green),
        // ],
      ),
    );
  }


}