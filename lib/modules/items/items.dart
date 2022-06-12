import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techincal/modules/items/cubit/cubit.dart';
import 'package:techincal/modules/items/cubit/states.dart';
import 'package:techincal/modules/users/users.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
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
        listener: (context, state) {
          if (state is TechItemsSuccessState) {
            BAR = true;
          }
        },
        builder: (context, state) {
          //print(TechItemsCubit.get(context).modelData[0].attributes!.menuName);
          if (state is TechItemsSuccessState) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
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
                title: const Text('التخصصات'),

                // leading: BackButton(color: Colors.white),
              ),
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
                      Image.asset('assets/images/bg.jpeg'),
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
                            condition: TechItemsCubit.get(context)
                                .modelData
                                .isNotEmpty,
                            builder: (context) => AnimationLimiter(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: TechItemsCubit.get(context)
                                    .modelData
                                    .length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      NavigateTo(
                                          context,
                                          UsersScreen(
                                              CategoryId,
                                              TechItemsCubit.get(context)
                                                  .modelData[index]
                                                  .attributes!
                                                  .menuName,
                                              TechItemsCubit.get(context)
                                                  .modelData[index]
                                                  .attributes!
                                                  .menuPrice
                                                  .toString()));
                                    },
                                    child: AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: ItemWidget(
                                              TechItemsCubit.get(context)
                                                  .modelData[index]
                                                  .attributes!
                                                  .menuName!,
                                              TechItemsCubit.get(context)
                                                  .modelData[index]
                                                  .attributes!
                                                  .menuPrice!
                                                  .toString()),
                                        ),
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
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
