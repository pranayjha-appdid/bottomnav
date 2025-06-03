// controllers/category_controller.dart
import 'package:get/get.dart';

class CategoryController extends GetxController implements GetxService{
  var selectedMainCategory = "Groceries".obs;
  var selectedSubCategory = "".obs;

  void updateMainCategory(String mainCategory) {
    selectedMainCategory.value = mainCategory;
    selectedSubCategory.value = ""; // reset
  }

  void updateSubCategory(String subCategory) {
    selectedSubCategory.value = subCategory;
  }
}
