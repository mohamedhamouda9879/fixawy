import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/layouts/home_tech.dart';
import 'package:techincal/models/order/order.dart';
import 'package:techincal/modules/favourite/cubit/states.dart';
import 'package:techincal/modules/favourite/favourite.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechGetOrdersCubit extends Cubit<TechGetOrdersStates> {
  TechGetOrdersCubit() : super(TechGetOrdersInitialStates());

  static TechGetOrdersCubit get(context) => BlocProvider.of(context);

  List<OrderModel> orderModel = [];

  List<OrderModel> orderModelTech = [];

  Future getOrders(BuildContext context) async {
    await DioHelper.getData(Url: 'orders', auth: 'Bearer $TOKEN').then((value) {
      (value.data['data'] as List<dynamic>).forEach((element) {
        orderModel.add(OrderModel.fromJson(element));
        print(element);
      });
      emit(TechGetOrdersSucessStates());
    }).catchError((error) {
      print('error');
      print(error);
      emit(TechGetOrdersErrorStates(error));
    });
  }

  Future getOrdersTech(BuildContext context) async {
    orderModelTech = [];
    await DioHelper.getData(
            Url: 'orders',
            auth:
                'Bearer 66|ETeNju3cN2maMnptL8uy23Eu3fSvR4agGABL8L0KhbNFMcwgTwXkc0PT4peEwmvozS2sf8oU4qTy7j3o')
        .then((value) {
      (value.data['data'] as List<dynamic>).forEach((element) {
        print(USERID);
        if (element['attributes']['tech_id'] == int.parse(USERID!)) {
          orderModelTech.add(OrderModel.fromJson(element));
        }

        print(element);
      });
      print('len ${orderModelTech.length}');
      emit(TechGetOrdersTechSucessStates());
    }).catchError((error) {
      print('error');
      print(error);
      emit(TechGetOrdersTechErrorStates(error));
    });
  }

  Future UpdateStatus(BuildContext context, String id) async {
    await DioHelper.updateData(
            Url: 'orders/$id', data: {"status_id": 3}, auth: 'Bearer $TOKEN')
        .then((value) {
      print(value.data);
      emit(TechChangeStatusSucessStates());
    }).catchError((error) {
      print('error');
      print(error);
      emit(TechChangeStatusErrorStates(error));
    });
  }

  void showDialog(BuildContext context, int index) {
    showAlertDialog(context, () {
      TechGetOrdersCubit.get(context)
          .UpdateStatus(
              context,
              TechGetOrdersCubit.get(context)
                  .orderModelTech[index]
                  .id
                  .toString())
          .then(
        (value) {
          getOrdersTech(context);
          emit(ChangeStats());
        },
      ).catchError((error) {
        print(error);
      });
      Navigator.of(context, rootNavigator: true).pop('dialog');
      // Navigator.of(context).pop();
    });
  }
}
