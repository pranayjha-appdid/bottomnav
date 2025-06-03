// controllers/category_controller.dart
import 'package:get/get.dart';

class CategoryController extends GetxController implements GetxService {
  // Use regular String variables instead of RxString (.obs)
  String selectedMainCategory = "Groceries";
  String selectedSubCategory = "";

  // Update main category and reset subcategory
  void updateMainCategory(String mainCategory) {
    selectedMainCategory = mainCategory;
    selectedSubCategory = ""; // reset subcategory when main changes
    update(); // Notify UI
  }

  // Update subcategory
  void updateSubCategory(String subCategory) {
    selectedSubCategory = subCategory;
    update(); // Notify UI
  }
}
