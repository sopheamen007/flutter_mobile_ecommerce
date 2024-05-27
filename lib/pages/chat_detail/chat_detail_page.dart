import 'package:e_commerce_app/models/message_model/message_data.dart';
import 'package:e_commerce_app/models/message_model/message_response.dart';
import 'package:e_commerce_app/models/user_model/user_data.dart';
import 'package:e_commerce_app/models/user_model/user_response.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:e_commerce_app/widgets/chat_detail/chat_detail_widget.dart';
import 'package:e_commerce_app/widgets/header_chat/header_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final int id;
  ChatDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredData = messageData.toList();
    return Scaffold(
      appBar: HeaderChatWidget(),
      body: getMessageBubble(filteredData, context),
      bottomSheet: getForm(),
    );
  }


  Widget getProfile(BuildContext context, int id) {
    UserResponse? filteredData = userData.firstWhere((filteredData) => filteredData.id == id);
    return Center(
      child: Column(
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
              'Chat',
              style: appTitle,
            ),
          ),
          SizedBox(height: 20),
          ChatDetailWidget(
            imagePath: filteredData.profileImage,
            fullName: filteredData.fullName,
            onlineStatus: filteredData.onlineStatus,
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }


  Widget getMessageBubble(List<MessageResponse> filteredData, BuildContext context) {
    return SingleChildScrollView(
      reverse: true, // Start scrolling from the bottom
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            alignment: Alignment.topCenter,
            scale: 0.3,
          ),
        ),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Show profile picture
            getProfile(context, id),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(filteredData.length, (index) {
                final message = filteredData[index];
                final isMe = message.isMe;
                final isSameUserAsPrevious =
                    index > 0 && filteredData[index - 1].isMe == isMe;
                final isConsecutiveSameUser =
                    isSameUserAsPrevious && filteredData[index - 1].isMe == isMe;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      crossAxisAlignment:
                          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: isConsecutiveSameUser ? 4 : 10,
                            bottom: 4,
                          ),
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            gradient: isMe
                                ? LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff7ce192),
                                      Color(0xff5dc281),
                                      Color(0xff44b671)
                                    ],
                                  )
                                : null,
                            color: !isMe ? Color(0xffefefef) : null,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: isMe || isConsecutiveSameUser
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                              bottomRight: isMe || isConsecutiveSameUser
                                  ? Radius.circular(0)
                                  : Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: isMe ? Color(0xffffffff) : Color(0xff262626),
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }


  Widget getForm() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffa9bee7).withOpacity(0.1), // Shadow color
                    spreadRadius: 25, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 0), // Offset
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 20,
                    right: 10,
                    top: 26,
                    bottom: 26,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_voice_outlined),
                      ),
                      SizedBox(width: 0),
                      Image.asset("assets/icons/send.png"),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
