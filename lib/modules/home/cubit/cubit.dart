import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/category/category.dart';
import 'package:techincal/modules/home/cubit/states.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechCategoryCubit extends Cubit<TechCategoryStates> {
  TechCategoryCubit() : super(TechCategoryInitialStates());

  static TechCategoryCubit get(context) => BlocProvider.of(context);

  CategoryModel? categoryModel;

  void getCategory(BuildContext context) {
    DioHelper.getData(Url: 'categories').then((value) {
      categoryModel = CategoryModel.fromJson(value.data);

      print('bos kda ${categoryModel!.data![0].attributes!.name}');
      emit(TechCategorySucessStates());
    }).catchError((error) {
      print(error);
      emit(TechCategoryErrorStates(error));
    });
  }
}
