import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techincal/modules/users/cubit/cubit.dart';
import 'package:techincal/modules/users/cubit/states.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/styles/colors.dart';

class UsersScreen extends StatelessWidget {
  List<ProductModel> products = [
    ProductModel(
        "Ahmed ali",
        "https://static.generated.photos/vue-static/face-generator/landing/wall/23.jpg",
        'ahmed is very good',
        4.0),
    ProductModel(
        "Ahmed ali",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        'ahmed is very good',
        4.0),
    ProductModel(
        "Ahmed ibrahim",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3qBVX4XIA8zq3LpBn64zAuOt9_IZ7_H5uA&usqp=CAU",
        'ahmed is very good',
        2.0),
    ProductModel(
        "samira ali",
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        'ahmed is very good',
        5.0),
    ProductModel(
        "sara ibrahim",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtjKiFMTHSbRUpn-6NWJjHPi_ATgGDlbxgo5MWjVgXjOnsxSq2Gyau5nP_iBpvhPstoes&usqp=CAU",
        'ahmed is very good',
        5.0),
    ProductModel(
        "salma rawy",
        "https://thumbs.dreamstime.com/b/surprised-female-person-confused-isolated-surprised-female-person-confused-isolated-168304856.jpg",
        'ahmed is very good',
        1.0),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => TechCustomersCubit(),
      child: BlocConsumer<TechCustomersCubit, TechCustomersStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {
                TechCustomersCubit.get(context).getCustomers();
              }),
              backgroundColor: HexColor('#001a2b'),
              body: ConditionalBuilderRec(
                condition: true,
                builder: (context) => AnimationLimiter(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return UserItem(
                          mq.width * .5,
                          products[index].image,
                          products[index].name,
                          products[index].rate,
                          products[index].descrption);
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

class ProductModel {
  String name, image, descrption;
  double rate;

  ProductModel(this.name, this.image, this.descrption, this.rate);
}
