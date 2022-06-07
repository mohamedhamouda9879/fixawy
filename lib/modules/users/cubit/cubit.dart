import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/customer/customer.dart';
import 'package:techincal/modules/users/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechCustomersCubit extends Cubit<TechCustomersStates> {
  TechCustomersCubit() : super(TechCustomersInitialState());

  static TechCustomersCubit get(context) => BlocProvider.of(context);

  List<CustomerModel> customerModel = [];

  void getCustomers(String id) {
    DioHelper.getData(
      Url: 'customers',
      auth: 'Bearer $TOKEN',
    ).then((value) {
      (value.data['data'] as List<dynamic>).forEach((element) {
        if (element['attributes']['customer_group_id'] == int.parse(id)) {
          customerModel.add(CustomerModel.fromJson(element));
        }
      });

      emit(TechCustomersSuccessState());
    }).catchError((error) {
      print(error);
      emit(TechCustomersErrorState(error));
    });
  }

  void CreateOrder(
      String UserId,
      String techId,
      String firstName,
      String lastName,
      String email,
      String mobile,
      String menuItemName,
      String todayDate,
      String todayTime,
      String price) {
    DioHelper.postData(Url: 'orders', auth: 'Bearer $TOKEN', data: {
      "customer_id": int.parse(UserId), // id bta3 el user
      "tech_id": int.parse(techId), // id bta3 el technician
      "location_id": 1,
      "first_name": firstName, //user
      "last_name": lastName, //user
      "email": email, //user
      "telephone": mobile, // user
      "comment": menuItemName, // 2sm el menu item
      "order_type": "collection",
      "order_date": todayDate, // today's date
      "order_time": todayTime, // now
      "total_items": 1,
      "payment": "cod",
      "processed": 1,
      "status_id": 8,
      "user_agent": "1",
      "order_total": double.parse(price)
    }).then((value) {
      showToast(message: 'Order Created', toastStates: ToastStates.SUCCESS);
      emit(TechOrdersSuccessState());
    }).catchError((error) {
      print(error);
      emit(TechOrdersErrorState(error));
    });
  }
}
