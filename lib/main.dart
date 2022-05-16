import 'package:flutter/material.dart';
import 'package:techincal/layouts/home.dart';
import 'package:techincal/modules/items/items.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

void main() async {
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemsScreen(),
    );
  }
}
