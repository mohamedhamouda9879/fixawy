import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techincal/modules/users/cubit/cubit.dart';
import 'package:techincal/modules/users/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';
import 'package:techincal/shared/styles/colors.dart';

class UsersScreen extends StatelessWidget {
  String? GroupId;
  String? menuName;
  String? price;
  UsersScreen(this.GroupId, this.menuName, this.price);
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => TechCustomersCubit()
        ..getCustomers(GroupId!)
        ..getLocation(context),
      child: BlocConsumer<TechCustomersCubit, TechCustomersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
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
                title: const Text('????????????????'),

                // leading: BackButton(color: Colors.white),
              ),
              backgroundColor: HexColor('#001a2b'),
              body: ConditionalBuilderRec(
                condition: true,
                builder: (context) => AnimationLimiter(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        TechCustomersCubit.get(context).customerModel.length,
                    itemBuilder: (context, index) {
                      return UserItem(
                          mq.width * .5,
                          'http://technician.amrhs.tech/assets/media/uploads/WhatsApp%20Image%202022-06-05%20at%206.25.29%20PM.jpeg',
                          TechCustomersCubit.get(context)
                              .customerModel[index]
                              .attributes!
                              .fullName!,
                          TechCustomersCubit.get(context)
                              .customerModel[index]
                              .attributes!
                              .rating!,
                          TechCustomersCubit.get(context)
                              .customerModel[index]
                              .attributes!
                              .notes!,
                          context, () {
                        //   print(USEE)
                        FirstName = CacheHelper.getData(key: 'firstname');
                        LastName = CacheHelper.getData(key: 'lastname');
                        Email = CacheHelper.getData(key: 'email');
                        Phone = CacheHelper.getData(key: 'phone');
                        print('print phone : $Phone');
                        var now = new DateTime.now();
                        var formatter = new DateFormat('yyyy-MM-dd');
                        String formattedDate = formatter.format(now);

                        TechCustomersCubit.get(context).CreateOrder(
                            USERID.toString(),
                            TechCustomersCubit.get(context)
                                .customerModel[index]
                                .id!
                                .toString(),
                            FirstName,
                            LastName,
                            Email,
                            Phone,
                            '${menuName!} - ${TechCustomersCubit.get(context).currentAddress}',
                            formattedDate,
                            now.toString(),
                            price!);

                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      }, () async {
                        FirstName = CacheHelper.getData(key: 'firstname');
                        LastName = CacheHelper.getData(key: 'lastname');
                        Email = CacheHelper.getData(key: 'email');
                        Phone = CacheHelper.getData(key: 'phone');

                        await FlutterPhoneDirectCaller.callNumber(Phone);
                      }, Phone);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                  ),
                ),
                fallback: (context) => Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: defaultColor,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: defaultColor,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
