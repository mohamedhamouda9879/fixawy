import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:techincal/layouts/cubit/cubit.dart';
import 'package:techincal/layouts/cubit/states.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  PersistentTabController? controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppLogOut) {
          SignOut(context);
        }
      }, builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            appBar: AppBar(
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color.fromARGB(255, 245, 140, 12),
                          Color.fromARGB(255, 250, 56, 2)
                        ]),
                  ),
                ),
                title: const Text('Technician'),
                automaticallyImplyLeading: false,
                // leading: BackButton(color: Colors.white),
                actions: [
                  Container(
                    width: 100,
                    child: IconButton(
                        onPressed: () {
                          SignOut(context);
                        },
                        icon: Row(
                          children: [
                            Text('Logout'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.logout),
                          ],
                        )),
                  )
                ]),
            bottomNavigationBar: CurvedNavigationBar(
              height: 55,
              backgroundColor: defaultColor,
              index: cubit.currentIndex,
              // ignore: prefer_const_literals_to_create_immutables
              items: <Widget>[
                const Icon(
                  Icons.person,
                  size: 25,
                ),
                const Icon(
                  Icons.home,
                  size: 25,
                ),
                const Icon(
                  Icons.shopping_bag,
                  size: 25,
                ),
              ],
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
            ),
          ),
        );
      }),
    );
  }
}
