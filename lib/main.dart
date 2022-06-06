import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/layouts/home.dart';
import 'package:techincal/layouts/home_tech.dart';
import 'package:techincal/modules/home/home.dart';
import 'package:techincal/modules/login/login.dart';
import 'package:techincal/shared/bloc_observer.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';

import 'package:techincal/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  Widget widget;
  TOKEN = CacheHelper.getData(key: 'token');
  CustomerTYPE = CacheHelper.getData(key: 'type');
  USERID = CacheHelper.getData(key: 'userId').toString();
  print(TOKEN);
  if (TOKEN != null) {
    if (CustomerTYPE != 1) {
      widget = HomeLayoutTech();
    } else {
      widget = HomeLayout();
    }
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
      home: startWidget,
    );
  }
}
