import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:techincal/layouts/cubit/cubit.dart';
import 'package:techincal/layouts/cubit/states.dart';
import 'package:techincal/shared/styles/colors.dart';

class HomeLayoutTech extends StatelessWidget {
  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppChangeBottomNavState) {}
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: PersistentTabView(
                context,
                controller: _controller,
                screens: AppCubit.get(context).buildScreensTech(),
                items: AppCubit.get(context).navBarsItemsTech(),
                confineInSafeArea: true,
                backgroundColor: defaultColor, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset:
                    true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows:
                    true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 245, 140, 12),
                      Color.fromARGB(255, 250, 56, 2),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  colorBehindNavBar: Colors.white,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle
                    .style1, // Choose the nav bar style with this property.
              ),
            ),
          );
        },
      ),
    );
  }
}
