import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/modules/items/cubit/cubit.dart';
import 'package:techincal/modules/items/cubit/states.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechItemsCubit(),
      child: BlocConsumer<TechItemsCubit, TechItemsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (() {
                TechItemsCubit.get(context).getItemsForCategory();
              }),
            ),
          );
        },
      ),
    );
  }
}
