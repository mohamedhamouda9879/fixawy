abstract class TechItemsStates {}

class TechItemsInitialState extends TechItemsStates {}

class TechItemsSuccessState extends TechItemsStates {}

class TechItemsErrorState extends TechItemsStates {
  String error;
  TechItemsErrorState(this.error);
}
