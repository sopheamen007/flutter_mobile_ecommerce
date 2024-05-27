import 'package:e_commerce_app/models/menu_model/menu_data.dart';
import 'package:e_commerce_app/models/restaurant_model/restaurant_data.dart';
import 'package:e_commerce_app/pages/menu/menu_page.dart';
import 'package:e_commerce_app/pages/promo/promo_page.dart';
import 'package:e_commerce_app/pages/restaurant/restaurant_page.dart';
import 'package:e_commerce_app/pages/restaurant_detail/restaurant_detail_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/buttons/button_text_link.dart';
import 'package:e_commerce_app/widgets/menu/menu_widget.dart';
import 'package:e_commerce_app/widgets/menu_detail/menu_detail_widget.dart';
import 'package:e_commerce_app/widgets/restaurant/restaurant_square_widget.dart';
import 'package:e_commerce_app/widgets/search_form/search_form_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bigPadding),
          child: Column(
            children: [
              SizedBox(height: 80),
              getHeader(),
              SizedBox(height: 20),
              getForm(),
              SizedBox(height: 20),
              getPromo(),
              SizedBox(height: 20),
              getNearestRestaurant(),
              SizedBox(height: 20),
              getPopularMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNearestRestaurant() {
    final filteredData = restaurantData.take(5).toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nearest Restaurants",
              style: subHeadline2,
            ),
            TextButtonLink(
              label: "View More",
              labelColor: Color(0xfffcb6a30),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> RestaurantPage()),
                );
              }
            )
          ],
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final restaurant = filteredData[index];
              final id = restaurant.id;
              return Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: RestaurantSquareWidget(
                  id: id,
                  imagePath: restaurant.profileImage,
                  name: restaurant.name,
                  totalMinutes: "12 mins", 
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> RestaurantDetailPage(id: id))
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget getPopularMenu() {
    final filteredData = menuData.take(5).toList();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular Menu",
              style: subHeadline2,
            ),
            TextButtonLink(
              label: "View More",
              labelColor: Color(0xfffcb6a30),
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> MenuPage()),
                );
              }
            )
          ],
        ),
        Column(
          children: List.generate(filteredData.length, (index) {
            final menu = filteredData[index];
            return MenuWidget(
              onTap: () {
                 showMenuDetail(menu);
              },
              id: menu.id,
              imagePath: menu.imageUrl,
              name: menu.name,
              restaurant: menu.restaurant.name,
              price: menu.price,
            );
          }),
        ),
      ],
    );
  }

  Widget getPromo() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context)=> PromoPage())
        );
      },
      child: Container(
        width: double.infinity,
        child: Image.asset("assets/promos/promo_1.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget getForm(){
    return SearchFormWidget(
      searchController: searchController,
      // onFocusChange: (value) {
      //   if (value) {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => MenuListPage()));
      //   }
      // },
    );
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

}
