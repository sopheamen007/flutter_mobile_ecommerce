import 'package:e_commerce_app/models/menu_model/menu_data.dart';
import 'package:e_commerce_app/models/user_model/user_data.dart';
import 'package:e_commerce_app/models/user_model/user_response.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/membership/membership_level.dart';
import 'package:e_commerce_app/widgets/menu/menu_favorite_widget.dart';
import 'package:e_commerce_app/widgets/voucher_notification/voucher_notification_widget.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserResponse? filteredData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    int id = 1;
    setState(() {
      filteredData = userData.firstWhere((user) => user.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: filteredData != null
          ? getBody(context)
          : Center(child: Text('User not found')),
      // bottomSheet: RootApp(),
    );
  }

  Widget getBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        getProfileBackground(),
        getContent(),
      ],
    );
  }

  Widget getContent() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0, // Fullscreen horizontally
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white, // Start color
                Colors.white, 
                Color(0xffff5f6fe), // End color
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Place your content here
                  SizedBox(height: 20),
                  MembershipLevelLabel(membershipLevel: filteredData!.membershipLevel),
                  SizedBox(height: 20),
                  getProfileInfo(),
                  SizedBox(height: 15),
                  getVoucherNotification(),
                  SizedBox(height: 35),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Forvorite",style: title3),
                  ),
                  SizedBox(height: 20),
                  getFavoriteMenu(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getVoucherNotification() {
    return VoucherNotificationWidget(
      imagePath: 'assets/icons/voucher.png',
    );
  }

  Widget getFavoriteMenu() {
    final filteredMenu = menuData.take(3).toList();
    return Column(
      children: List.generate(filteredMenu.length, (index) {
        final menuItem = filteredMenu[index];
        return MenuFavoriteWidget(
          imagePath: menuItem.imageUrl,
          name: menuItem.name,
          restaurant: menuItem.restaurant.name,
          price: menuItem.price,
          onTap: (){
            //
          }
        );
      }),
    );
  }

  Widget getProfileInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filteredData!.fullName,
                style: bigTitle,
              ),
              Image.asset("assets/icons/edit-icon.png"),
            ],
          ),
          Text(filteredData!.email,
            style: subHeadline2.copyWith(color: appBlack.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }

  Widget getProfileBackground() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(filteredData!.profileImage),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
