import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:techincal/layouts/home_tech.dart';
import 'package:techincal/modules/orders/cubit/cubit.dart';
import 'package:techincal/modules/orders/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/styles/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechGetOrdersCubit()
        ..getOrdersTech(context)
        ..getOrders(context),
      child: BlocConsumer<TechGetOrdersCubit, TechGetOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(' bos kda l type${CustomerTYPE.toString()}');
          return Scaffold(
            backgroundColor: HexColor('#001a2b'),
            body: ConditionalBuilderRec(
              condition: CustomerTYPE != 1
                  ? TechGetOrdersCubit.get(context).orderModelTech.isNotEmpty
                  : TechGetOrdersCubit.get(context).orderModel.isNotEmpty,
              builder: (context) => AnimationLimiter(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: CustomerTYPE != 1
                      ? TechGetOrdersCubit.get(context).orderModelTech.length
                      : TechGetOrdersCubit.get(context).orderModel.length,
                  itemBuilder: (context, index) {
                    String date = CustomerTYPE != 1
                        ? TechGetOrdersCubit.get(context)
                            .orderModelTech[index]
                            .attributes!
                            .orderDate
                            .toString()
                        : TechGetOrdersCubit.get(context)
                            .orderModel[index]
                            .attributes!
                            .orderDate
                            .toString();
                    print(date);
                    String formatted = date.substring(0, 10);
                    print(formatted);
                    return InkWell(
                      onTap: () {
                        if (CustomerTYPE != 1) {
                          TechGetOrdersCubit.get(context)
                              .showDialog(context, index);
                        }
                      },
                      child: AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: OrderItem(
                                CustomerTYPE != 1
                                    ? TechGetOrdersCubit.get(context)
                                        .orderModelTech[index]
                                        .attributes!
                                        .comment
                                        .toString()
                                    : TechGetOrdersCubit.get(context)
                                        .orderModel[index]
                                        .attributes!
                                        .comment
                                        .toString(),
                                CustomerTYPE != 1
                                    ? TechGetOrdersCubit.get(context)
                                        .orderModelTech[index]
                                        .attributes!
                                        .statusName
                                        .toString()
                                    : TechGetOrdersCubit.get(context)
                                        .orderModel[index]
                                        .attributes!
                                        .statusName
                                        .toString(),
                                CustomerTYPE != 1
                                    ? TechGetOrdersCubit.get(context)
                                        .orderModelTech[index]
                                        .attributes!
                                        .orderTime
                                        .toString()
                                    : TechGetOrdersCubit.get(context)
                                        .orderModel[index]
                                        .attributes!
                                        .orderTime
                                        .toString(),
                                formatted),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
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
          );
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context, VoidCallback voidCallback) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(color: defaultColor),
    ),
    onPressed: voidCallback,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Technician"),
    content: Text("If you need Accept Please click Accept"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
