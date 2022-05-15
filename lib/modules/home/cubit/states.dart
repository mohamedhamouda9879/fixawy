abstract class TechCategoryStates {}

class TechCategoryInitialStates extends TechCategoryStates {}

class TechCategoryLoadingStates extends TechCategoryStates {}

class TechCategorySucessStates extends TechCategoryStates {}

class TechCategoryErrorStates extends TechCategoryStates {
  String error;
  TechCategoryErrorStates(this.error);
}
