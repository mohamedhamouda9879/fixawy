import 'package:flutter/material.dart';
import 'package:techincal/modules/profile/infocard.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';

class ProfileScreen extends StatelessWidget {
  String FullName =
      '${CacheHelper.getData(key: 'firstname')} ${CacheHelper.getData(key: 'lastname')}';
  String email = CacheHelper.getData(key: 'email');
  String phone = CacheHelper.getData(key: 'phone');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/bg.jpeg'),
              ),
              Text(
                "$FullName",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),

              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),

              InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
              SizedBox(
                height: 15,
              ),
              defaultButton(
                  function: () {
                    SignOut(context);
                  },
                  text: 'Logout',
                  radius: 12,
                  width: 250)
            ],
          ),
        ));
  }
}
