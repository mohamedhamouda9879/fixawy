abstract class TechCustomersStates {}

class TechCustomersInitialState extends TechCustomersStates {}

class TechCustomersSuccessState extends TechCustomersStates {}

class TechCustomersErrorState extends TechCustomersStates {
  String error;
  TechCustomersErrorState(this.error);
}

class TechOrdersSuccessState extends TechCustomersStates {}

class TechLocationState extends TechCustomersStates {}

class TechOrdersErrorState extends TechCustomersStates {
  String error;
  TechOrdersErrorState(this.error);
}
