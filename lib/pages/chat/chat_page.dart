import 'package:e_commerce_app/models/user_model/user_response.dart';
import 'package:e_commerce_app/models/user_model/user_data.dart';
import 'package:e_commerce_app/widgets/chat/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/themes/styles.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final filteredData = userData.take(3).toList(); // Selecting 2 records

    return Scaffold(
      body: getBody(filteredData),
    );
  }

  Widget getBody(List<UserResponse> filteredData) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff8f9fe),
        image:DecorationImage(
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
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Chat',
              style: appTitle,
            ),
          ),
          SizedBox(height: 20),
          Column(
              children: List.generate(filteredData.length, (index) {
                final user = filteredData[index];
                return ChatWidget(
                  id: user.id,
                  imagePath: user.profileImage, 
                  fullName: user.fullName, 
                  orderStatus: user.onlineStatus.toString(),
                  time: "20:00",
                  onTap: (){
                    // print("object");
                  },
                );
              }),
          ),
        ],
      ),
    );
  }


}
