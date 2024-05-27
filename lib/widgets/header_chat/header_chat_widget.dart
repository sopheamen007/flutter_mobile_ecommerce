import 'package:flutter/material.dart';

class HeaderChatWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back button tap
        },
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profiles/profile_pic_1.png'),
          ),
          SizedBox(width: 8),
          Text("John Doe"),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {
            // Handle call icon tap
          },
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {
            // Handle video icon tap
          },
        ),
      ],
    );
  }
}
