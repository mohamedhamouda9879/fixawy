import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:techincal/modules/login/signin.dart';
import 'package:techincal/modules/login/signup.dart';
import 'package:techincal/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/bg.jpeg',
                fit: BoxFit.cover,
              ),
              Container(
                height: 900,
                color: Colors.black26,
                child: ContainedTabBarView(
                  initialIndex: 0,
                  callOnChangeWhileIndexIsChanging: true,
                  tabBarProperties: TabBarProperties(
                    indicatorColor: defaultColor,
                  ),
                  onChange: (index) => print(index),
                  tabs: [
                    Text(
                      'تسجيل ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'تسجيل دخول',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                  views: [
                    SignInScreen(),
                    SignUpScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
