import 'package:e_commerce_app/models/menu_model/menu_data.dart';
import 'package:e_commerce_app/models/restaurant_model/restaurant_data.dart';
import 'package:e_commerce_app/models/restaurant_model/restaurant_response.dart';
import 'package:e_commerce_app/models/testimonial_model/testimonial_data.dart';
import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/menu/menu_square_widget.dart';
import 'package:e_commerce_app/widgets/menu_detail/menu_detail_widget.dart';
import 'package:e_commerce_app/widgets/testimonial/testimonial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestaurantDetailPage extends StatefulWidget {
  final int id;

  RestaurantDetailPage({required this.id});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  RestaurantResponse? filteredData;

  @override
  void initState() {
    super.initState();
    fetchRestaurantData();
  }

  void fetchRestaurantData() {
    setState(() {
      filteredData =
          restaurantData.firstWhere((restaurant) => restaurant.id == widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: filteredData != null
          ? getBody(context)
          : Center(child: Text('Restaurant not found')),
    );
  }

  Widget getBody(BuildContext context) {
    return Stack(
      children: [
        getProfileBackground(),
        getContent(),
        getBackIcon(),
      ],
    );
  }

  Widget getBackIcon() {
    return Positioned(
      top: 70,
      left: 30,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget getContent() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xffff5f6fe),
                Color(0xffff5f6fe),
                Color(0xfffdce7fe),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/icons/popular_status.png"),
                    Row(
                      children: [
                        Image.asset("assets/icons/location.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset("assets/icons/love.png"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                getProfileInfo(),
                SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Popular Menu", style: headline),
                ),
                SizedBox(height: 20),
                getPopularMenu(),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Testimonials", style: headline),
                ),
                SizedBox(height: 5),
                getTestimonial(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getPopularMenu() {
    final filteredMenu = menuData.take(5).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(filteredMenu.length, (index) {
          final menuItem = filteredMenu[index];
          final int id = menuItem.id;
          return MenuSquareWidget(
            id: id,
            imagePath: menuItem.imageUrl,
            name: menuItem.name,
            price: menuItem.price,
            onTap: () {
              showMenuDetail(menuItem);
            },
          );
        }),
      ),
    );
  }

  void showMenuDetail(menu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Transform.translate(
          offset: Offset(0.0, 33.0), // Apply margin-bottom: -33px
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              child: Container(
                color: Colors.white,
                child: MenuDetailWidget(menu: menu),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getTestimonial() {
    final filteredData = testimonialData.take(5).toList();
    return Column(
      children: List.generate(filteredData.length, (index) {
        final testimonial = filteredData[index];
        return TestimonialWidget(
            id: testimonial.id,
            imagePath: testimonial.user.profileImage,
            fullName: testimonial.user.fullName,
            comment: testimonial.comment,
            date: testimonial.date,
            starRating: testimonial.starRating,
            onTap: () {
              //
            });
      }),
    );
  }

  Widget getProfileInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filteredData!.name,
            style: bigTitle,
          ),
          SizedBox(
            height: smallHeight,
          ),
          Row(
            children: [
              Image.asset("assets/icons/location_pin.png"),
              SizedBox(
                width: smallWidth,
              ),
              Text(
                "19km",
                style: body.copyWith(color: appBlack.withOpacity(0.5)),
              ),
              SizedBox(
                width: bigWidth,
              ),
              Image.asset("assets/icons/star_half_green.png"),
              SizedBox(
                width: smallWidth,
              ),
              Text(
                "4.8 Rating",
                style: body.copyWith(color: appBlack.withOpacity(0.5)),
              ),
            ],
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
          image: AssetImage(filteredData!.coverImage),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
