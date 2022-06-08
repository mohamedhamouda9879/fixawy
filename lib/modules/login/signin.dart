import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/layouts/home.dart';
import 'package:techincal/layouts/home_tech.dart';
import 'package:techincal/modules/home/home.dart';
import 'package:techincal/modules/login/cubit/cubit.dart';
import 'package:techincal/modules/login/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';
import 'package:techincal/shared/styles/colors.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechLoginCubit(),
      child: BlocConsumer<TechLoginCubit, TechLoginStates>(
        listener: (context, state) {
          if (state is TechLoginSucessStates) {
            if (state.TechLoginModel.token != null) {
              CacheHelper.saveData(
                      key: 'token', value: state.TechLoginModel.token)
                  .then((value) {
                TOKEN = state.TechLoginModel.token.toString();

                if (state.TechLoginModel.customerType != 1) {
                  NavigateAndFinish(context, HomeLayoutTech());
                } else {
                  NavigateAndFinish(context, HomeLayout());
                }
              });
              CacheHelper.saveData(
                      key: 'type', value: state.TechLoginModel.customerType)
                  .then((value) {
                CustomerTYPE = state.TechLoginModel.customerType;
              });

              CacheHelper.saveData(
                      key: 'userId', value: state.TechLoginModel.customerId)
                  .then((value) {
                USERID = state.TechLoginModel.customerId.toString();
              });

              CacheHelper.saveData(
                      key: 'firstname', value: state.TechLoginModel.firstName)
                  .then((value) {
                FirstName = state.TechLoginModel.firstName.toString();
              });
              CacheHelper.saveData(
                      key: 'lastname', value: state.TechLoginModel.lastName)
                  .then((value) {
                LastName = state.TechLoginModel.lastName.toString();
              });
              CacheHelper.saveData(
                      key: 'email', value: state.TechLoginModel.email)
                  .then((value) {
                Email = state.TechLoginModel.email.toString();
              });
              CacheHelper.saveData(
                      key: 'phone', value: state.TechLoginModel.telephone)
                  .then((value) {
                Phone = state.TechLoginModel.telephone.toString();
              });

              showToast(
                  message: 'Successfully Login',
                  toastStates: ToastStates.SUCCESS);
            } else {
              print('hamouda error f eno ygeb l token 34an b null');
              // print(state.TechLoginModel.token);
              showToast(
                  message: "Wrong Sign In", toastStates: ToastStates.EROOR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HexColor('#001a2b'),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amst , consetetur sadipscing elitr ,sed diam nonmy eirmod',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                              return null;
                            },
                            label: 'Email',
                            prefix: Icons.email),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty)
                                return 'Password is Too Short';
                              return null;
                            },
                            isPassword:
                                TechLoginCubit.get(context).isPasswordShowen,
                            label: 'Password',
                            lines: 1,
                            suffix: TechLoginCubit.get(context).sufix,
                            suffixPressed: () {
                              TechLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            prefix: Icons.lock),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultButton(
                            function: () {
                              print('${emailController.text}');
                              TechLoginCubit.get(context).UserLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context);
                            },
                            text: 'Login',
                            radius: 12.0,
                            isUpperCase: true),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.face,
                            color: defaultColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.social_distance,
                            color: defaultColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.message,
                            color: defaultColor,
                            size: 30,
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
