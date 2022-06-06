abstract class TechGetOrdersStates {}

class TechGetOrdersInitialStates extends TechGetOrdersStates {}

class TechGetOrdersLoadingStates extends TechGetOrdersStates {}

class TechGetOrdersSucessStates extends TechGetOrdersStates {}

class TechGetOrdersErrorStates extends TechGetOrdersStates {
  String error;
  TechGetOrdersErrorStates(this.error);
}

class TechGetOrdersTechSucessStates extends TechGetOrdersStates {}

class TechGetOrdersTechErrorStates extends TechGetOrdersStates {
  String error;
  TechGetOrdersTechErrorStates(this.error);
}

class TechChangeStatusSucessStates extends TechGetOrdersStates {}

class TechChangeStatusErrorStates extends TechGetOrdersStates {
  String error;
  TechChangeStatusErrorStates(this.error);
}

class ChangeStats extends TechGetOrdersStates {}
