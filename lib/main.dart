import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/layouts/home.dart';
import 'package:techincal/modules/home/home.dart';
import 'package:techincal/modules/login/login.dart';
import 'package:techincal/shared/bloc_observer.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';

import 'package:techincal/shared/network/remote/dio_helper.dart';

void main() async {
  await DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Widget widget;
  // TOKEN = CacheHelper.getData(key: 'token');
  // USERID = CacheHelper.getData(key: 'UserID');

  if (TOKEN != null) {
    widget = HomeScreen();
  } else {
    widget = const LoginScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
