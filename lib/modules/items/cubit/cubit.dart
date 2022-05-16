import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/item/item.dart';
import 'package:techincal/modules/items/cubit/states.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechItemsCubit extends Cubit<TechItemsStates> {
  TechItemsCubit() : super(TechItemsInitialState());

  static TechItemsCubit get(context) => BlocProvider.of(context);

  // ItemsModel? itemsModel;
  //http://technician.amrhs.tech/api/menus?include=categories
  ItemsModel? itemsModel;
  void getItemsForCategory() {
    DioHelper.getData(Url: 'menus', query: {'include': 'categories'})
        .then((value) {
      print(value.data);
      print('Done Check');
      itemsModel = ItemsModel.fromJson(value.data);
      print(value.data);
      // itemsModel = value.data['data'];
      // print('Done Check');
      // //print(value.data['data']);
      // // print('${iitemModel[0]['attributes']['menu_name']}');
      // (value.data['data'] as List<dynamic>).forEach(
      //   (element) {
      //     var item = ItemsModel.fromJson(element);
      //     print("here ${item.toString()}");
      //     items.add(item);
      //   },
      // );

      emit(TechItemsSuccessState());
    }).catchError((error) {
      emit(TechItemsErrorState(error));
    });
  }
}
