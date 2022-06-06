import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/modules/home/cubit/cubit.dart';
import 'package:techincal/modules/home/cubit/states.dart';
import 'package:techincal/modules/items/items.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
      create: (context) => TechCategoryCubit()..getCategory(context),
      child: BlocConsumer<TechCategoryCubit, TechCategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TechCategorySucessStates) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 174, 174, 174),
                              Color.fromARGB(255, 252, 249, 246),
                            ],
                          ),
                        ),
                        width: double.infinity,
                        height: mq.height * .30,
                      ),
                      Image.asset('assets/images/bg.jpeg'),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    color: HexColor('#001a2b'),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        shadows: [
                          Shadow(color: Colors.white, offset: Offset(0, -5))
                        ],
                        fontSize: 22.0,
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 255, 108, 34),
                        decorationThickness: 4,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          color: HexColor('#001a2b'),
                        ),
                        SizedBox(
                            child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (orientation == Orientation.portrait)
                                          ? 2
                                          : 3),
                          itemCount: TechCategoryCubit.get(context)
                              .categoryModel!
                              .data!
                              .length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                print(
                                    'ne ${TechCategoryCubit.get(context).categoryModel!.data![i].id}');
                                CategoryId = TechCategoryCubit.get(context)
                                    .categoryModel!
                                    .data![i]
                                    .id
                                    .toString();
                                NavigateTo(
                                    context,
                                    ItemsScreen(
                                      TechCategoryCubit.get(context)
                                          .categoryModel!
                                          .data![i]
                                          .id,
                                    ));
                              },
                              child: CategoryItem(
                                TechCategoryCubit.get(context)
                                    .categoryModel!
                                    .data![i]
                                    .attributes!
                                    .permalinkSlug,
                                TechCategoryCubit.get(context)
                                    .categoryModel!
                                    .data![i]
                                    .attributes!
                                    .name,
                              ),
                            );
                          },
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
