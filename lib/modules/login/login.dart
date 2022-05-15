import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:techincal/modules/login/signin.dart';
import 'package:techincal/modules/login/signup.dart';
import 'package:techincal/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/bg.jpeg',
                fit: BoxFit.cover,
              ),
              Container(
                height: mq.height * 0.99,
                color: Colors.black26,
                child: ContainedTabBarView(
                  tabBarProperties:
                      TabBarProperties(indicatorColor: defaultColor),
                  tabs: [
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'SignUp',
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
