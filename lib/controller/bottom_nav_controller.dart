import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/services/route_helper.dart';
import '../views/subcategory_page.dart';
import '../controller/category_controller.dart';
import '../main.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  var categoryLabel = "Groceries".obs;

  void changeTab(int index) {
    if (index == 1 && currentIndex.value == 1) {
      final categoryCtrl = Get.find<CategoryController>();

      categoryNavigatorKey.currentState?.pushAndRemoveUntil(
        getCustomRoute(
          child: SubcategoryPage(
            mainCategory: categoryCtrl.selectedMainCategory.value,
          ),
        ),
        (route) => false,
      );
    }

    currentIndex.value = index;
  }

  void updateCategoryLabel(String newLabel) {
    categoryLabel.value = newLabel;

    final categoryCtrl = Get.find<CategoryController>();
    categoryCtrl.updateMainCategory(newLabel);

    categoryNavigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => SubcategoryPage(
          mainCategory: newLabel,
        ),
      ),
      (route) => false,
    );

    currentIndex.value = 1;
  }
}
