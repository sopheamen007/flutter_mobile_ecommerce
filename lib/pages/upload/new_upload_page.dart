import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHeader(),
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/mobile.svg",
          color: Colors.white,
          height: 100,
        ),
        SizedBox(height: 20),
        Text(
          "Allow Instagram to access your camera and microphone",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 0,
          ),
        ),
        SizedBox(height: 100),
        SvgPicture.asset("assets/icons/record.svg",
          color: Colors.red,
          height: 100,
        ),
      ],
    );
  }

  AppBar getHeader() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('New Post', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.close, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
