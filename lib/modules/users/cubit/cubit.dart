import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techincal/models/customer/customer.dart';
import 'package:techincal/modules/users/cubit/states.dart';
import 'package:techincal/shared/network/remote/dio_helper.dart';

class TechCustomersCubit extends Cubit<TechCustomersStates> {
  TechCustomersCubit() : super(TechCustomersInitialState());

  static TechCustomersCubit get(context) => BlocProvider.of(context);

  List<CustomerModel> customerModel = [];

  void getCustomers() {
    DioHelper.getData(
      Url: 'customers',
      auth:
          'Bearer 45|4WPmF7JgZ3TR170szq4hxCgWi7iCx7Ll9PCkYjuzOZ4XN07C3lKe86KGQzeLZbjrEmRKsDjqPU0z32uz',
    ).then((value) {
      print('object');
      print('doen');
      (value.data['data'] as List<dynamic>).forEach((element) {
        customerModel.add(CustomerModel.fromJson(element));
        print(element);
      });

      emit(TechCustomersSuccessState());
    }).catchError((error) {
      print(error);
      emit(TechCustomersErrorState(error));
    });
  }
}
