import 'package:e_commerce_app/themes/colors.dart';
import 'package:e_commerce_app/themes/styles.dart';
import 'package:flutter/material.dart';

class ListileCard extends StatelessWidget {
  final Widget logo;
  final String profileAcessValue;
  const ListileCard({super.key,this.logo =  const SizedBox(),this.profileAcessValue = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: textFieldBackgroundColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(bigPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              logo,
              ListTile(
                leading: Text("Profile access"),
                trailing: Text(profileAcessValue,style: caption,),
              ),
            
          ],
        ),
      ),
    );
  }
}