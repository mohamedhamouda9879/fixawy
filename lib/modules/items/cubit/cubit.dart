import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/item/item.dart';
import 'package:techincal/modules/items/cubit/states.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechItemsCubit extends Cubit<TechItemsStates> {
  TechItemsCubit() : super(TechItemsInitialState());

  static TechItemsCubit get(context) => BlocProvider.of(context);

  List data = [];
  List<ItemModel> modelData = [];
  void getItemsForCategory(String id) {
    DioHelper.getData(Url: 'menus', query: {'include': 'categories'})
        .then((value) {
      print(value.data['data'][2]['relationships']['categories']['data'][0]
          ['id']);

      (value.data['data'] as List<dynamic>).forEach((element) {
        // print(element['relationships']['categories']['data'][0]['id']);
        if (element['relationships']['categories']['data'][0]['id'] == id) {
          modelData.add(ItemModel.fromJson(element));
          print(element);
        }
      });

      //print(modelData[0].attributes!.menuName);

      emit(TechItemsSuccessState());
    }).catchError((error) {
      emit(TechItemsErrorState(error));
    });
  }
}
