import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/modules/login/cubit/cubit.dart';
import 'package:techincal/modules/login/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/styles/colors.dart';

class SignInScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechLoginCubit(),
      child: BlocConsumer<TechLoginCubit, TechLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: HexColor('#001a2b'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
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
                              label: 'Password',
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
            ),
          );
        },
      ),
    );
  }
}
