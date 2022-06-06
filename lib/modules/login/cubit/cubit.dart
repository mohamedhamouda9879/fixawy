import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/layouts/home.dart';
import 'package:techincal/models/login/error.dart';
import 'package:techincal/models/login/login.dart';
import 'package:techincal/modules/login/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechLoginCubit extends Cubit<TechLoginStates> {
  TechLoginCubit() : super(TechLoginInitialStates());

  static TechLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? TechLoginModel;
  LoginModelError? loginModelError;
  void UserLogin(
      {required String email,
      required String password,
      required BuildContext? context}) {
    emit(TechLoginLoadingStates());
    DioHelper.postData(
      Url: 'token',
      query: {'email': email, 'password': password, 'device_name': 'Hadota'},
    ).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        TechLoginModel = LoginModel.fromJson(value.data);

        if (TechLoginModel!.statusCode == 201) {
          //         if (TechLoginModel!.customerType != 1) {
          //  NavigateAndFinish(context, HomeLayout());
          //         }
          NavigateAndFinish(context, HomeLayout());
          emit(TechLoginSucessStates(TechLoginModel!));
        }
      }
    }).catchError(((error) {
      if (error is DioError) {
        print(error.response);
        showToast(
            message: error.response!.data['message'],
            toastStates: ToastStates.EROOR);
      }
      showToast(
          message: 'Enter Your Email and Password',
          toastStates: ToastStates.EROOR);
      emit(TechLoginErrorStates(error));
    }));
    // .catchError((error) {
    //   //print(loginModelError!.message.toString());
    //   if (error is DioHelper) {
    //     print(error.toString());
    //   }
    //   showToast(
    //       message: 'Enter Your Email and Password',
    //       toastStates: ToastStates.EROOR);
    //   emit(TechLoginErrorStates(error));
    // });
  }

  IconData sufix = Icons.visibility_outlined;
  bool isPasswordShowen = true;

  void changePasswordVisibility() {
    print("isPasswordShowen : $isPasswordShowen");
    isPasswordShowen = !isPasswordShowen;
    sufix = isPasswordShowen
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(TechChangePasswordVisibilityStates());
  }
}
