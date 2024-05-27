import 'package:e_commerce_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFormWidget extends StatelessWidget {
  final TextEditingController searchController;
  // final VoidCallback? onPressed;
  final ValueChanged<bool>? onFocusChange;
  const SearchFormWidget({super.key, required this.searchController, this.onFocusChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Focus(
              onFocusChange: onFocusChange,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffff9ebd5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Color(0xfffcb6a30)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xfffcb6a30),
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Color(0xfffcb6a30)),
                          onPressed: () {
                            searchController.clear();
                          },
                        )
                      : null,
                    contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                  ),
                  style: TextStyle(color: appBlack),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffff9ebd5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Color(0xfffcb6a30),
              width: 35,
            ),
          ),
        ],
      ),
    );
  }
}
