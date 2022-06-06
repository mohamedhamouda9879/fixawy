// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:techincal/modules/login/login.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';

void SignOut(context) {
  CacheHelper.RemoveData(key: 'token').then((value) {
    if (value) {
      NavigateAndFinish(context, LoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

String? TOKEN = '';
int? CustomerTYPE = 0;

String NEWSID = '';
String? USERID = '';

String POSTID = '';
bool checkFav = false;
String CategoryId = '';

String ItemName = '';

String FirstName = '';
String LastName = '';
String Phone = '';
String Email = '';
