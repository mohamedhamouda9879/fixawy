import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:techincal/layouts/cubit/states.dart';
import 'package:techincal/modules/home/home.dart';
import 'package:techincal/modules/orders/orders.dart';
import 'package:techincal/modules/profile/profile.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/styles/colors.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

  List<Widget> bottomScreens = [
    ProfileScreen(),
    HomeScreen(),
    const OrdersScreen(),
  ];
  List<Widget> bottomScreenstech = [
    ProfileScreen(),
    const OrdersScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  List<Widget> buildScreens() {
    return [ProfileScreen(), HomeScreen(), const OrdersScreen()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Orders"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> buildScreensTech() {
    return [ProfileScreen(), const OrdersScreen()];
  }

  List<PersistentBottomNavBarItem> navBarsItemsTech() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Orders"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  logout(BuildContext context) {
    SignOut(context);
    emit(AppLogOut());
  }
}
