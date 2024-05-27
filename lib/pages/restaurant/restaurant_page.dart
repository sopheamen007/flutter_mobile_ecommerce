import 'package:e_commerce_app/models/restaurant_model/restaurant_data.dart';
import 'package:e_commerce_app/models/restaurant_model/restaurant_response.dart';
import 'package:e_commerce_app/pages/restaurant_detail/restaurant_detail_page.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/restaurant/restaurant_square_widget.dart';
import 'package:e_commerce_app/widgets/search_form/search_form_widget.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<RestaurantResponse> filteredData = restaurantData; // Initialize with all menu data
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
        filteredData = restaurantData;
      } else {
        filteredData = restaurantData.where((search) {
          return search.name.toLowerCase().contains(query) || search.name.toLowerCase().contains(query);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: bigPadding),
          child: Column(
            children: [
              SizedBox(height: 80),
              getHeader(),
              SizedBox(height: 20),
              getForm(),
              SizedBox(height: 40),
              getMenu(),
            ],
          ),
        ),
      ),
      // bottomSheet: GetFooter(),
    );
  }

  Widget getMenu() {
    if (filteredData.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'No restaurant found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular Restaurants",
          style: subHeadline2,
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(filteredData.length, (index) {
            return Container(
              child: GridView.count(
                shrinkWrap: true, // Add this line
                primary: false,
                padding: EdgeInsets.zero,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: List.generate(filteredData.length, (index) {
                  final restaurant = filteredData[index];
                  final id = restaurant.id;
                  return RestaurantSquareWidget(
                    id: id,
                    imagePath: restaurant.profileImage,
                    name: restaurant.name,
                    totalMinutes: "12 mins",
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> RestaurantDetailPage(id: id))
                      );
                    },
                  );
                }),
              ),
            );
          }),
        ),
      ],
    );
  }


  Widget getForm() {
    return SearchFormWidget(searchController: searchController);
  }

  Widget getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/back.png',
            width: 45,
          ),
        ),
        SizedBox(height: meduimHeight,),
        Row(
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
        ),
      ],
    );
  }
}
