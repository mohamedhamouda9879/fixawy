import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techincal/modules/items/cubit/cubit.dart';
import 'package:techincal/modules/items/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/styles/colors.dart';

class ItemsScreen extends StatelessWidget {
  String? categoryId;
  ItemsScreen(this.categoryId);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
      create: (context) => TechItemsCubit()..getItemsForCategory(categoryId!),
      child: BlocConsumer<TechItemsCubit, TechItemsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          //print(TechItemsCubit.get(context).modelData[0].attributes!.menuName);
          return Scaffold(
            body: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Card(
                        elevation: 12,
                        shadowColor: defaultColor,
                        child: defaultFormField(
                            controller: searchController,
                            type: TextInputType.name,
                            validate: (String? value) {},
                            label: 'Search',
                            prefix: Icons.search),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        color: HexColor('#001a2b'),
                      ),
                      SizedBox(
                        child: ConditionalBuilderRec(
                          condition:
                              TechItemsCubit.get(context).modelData.isNotEmpty,
                          builder: (context) => AnimationLimiter(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  TechItemsCubit.get(context).modelData.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: ItemWidget(
                                          TechItemsCubit.get(context)
                                              .modelData[index]
                                              .attributes!
                                              .menuName!),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 8,
                                );
                              },
                            ),
                          ),
                          fallback: (context) => Center(
                            child: SizedBox(
                              width: 200.0,
                              height: 100.0,
                              child: Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: defaultColor,
                                child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: defaultColor,
                                    child:
                                        Image.asset('assets/images/bg.jpeg')),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // body: Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Center(
            //     child: Container(
            //       width: double.infinity,
            //       height: 70,
            //       child: Card(
            //         shadowColor: defaultColor,
            //         elevation: 8,
            //         child: Center(
            //             child: Text(
            //           'YAM PORRIDGE',
            //           style: TextStyle(
            //               fontSize: 18.0, fontWeight: FontWeight.bold),
            //         )),
            //       ),
            //     ),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
