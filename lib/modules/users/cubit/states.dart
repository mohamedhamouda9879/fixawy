abstract class TechCustomersStates {}

class TechCustomersInitialState extends TechCustomersStates {}

class TechCustomersSuccessState extends TechCustomersStates {}

class TechCustomersErrorState extends TechCustomersStates {
  String error;
  TechCustomersErrorState(this.error);
}
