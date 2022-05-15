import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/item/item.dart';
import 'package:techincal/modules/items/cubit/states.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechItemsCubit extends Cubit<TechItemsStates> {
  TechItemsCubit() : super(TechItemsInitialState());

  static TechItemsCubit get(context) => BlocProvider.of(context);

  //ItemModel? itemModel;

  void getItemsForCategory() {
    DioHelper.getData(Url: 'menus', query: {'include': 'categories'})
        .then((value) {
      print('Done Check');
      var iitemModel = value.data['data'];
      print('Done Check');
      print('${iitemModel[0]['attributes']['menu_name']}');

      emit(TechItemsSuccessState());
    }).catchError((error) {
      emit(TechItemsErrorState(error));
    });
  }
}
