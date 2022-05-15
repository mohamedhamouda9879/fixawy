import 'package:techincal/models/login/error.dart';
import 'package:techincal/models/login/login.dart';

abstract class TechLoginStates {}

class TechLoginInitialStates extends TechLoginStates {}

class TechLoginLoadingStates extends TechLoginStates {}

class TechLoginSucessStates extends TechLoginStates {
  LoginModel TechLoginModel;

  TechLoginSucessStates(this.TechLoginModel);
}

class TechLoginErrorStates extends TechLoginStates {
  String error;
  TechLoginErrorStates(this.error);
}

class TechChangePasswordVisibilityStates extends TechLoginStates {}
