import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/modules/home/cubit/cubit.dart';
import 'package:techincal/modules/home/cubit/states.dart';
import 'package:techincal/modules/items/items.dart';
import 'package:techincal/shared/components/components.dart';
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
