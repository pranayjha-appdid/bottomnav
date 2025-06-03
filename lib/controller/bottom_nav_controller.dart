import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/services/route_helper.dart';
import '../views/subcategory_page.dart';
import '../controller/category_controller.dart';
import '../main.dart';

class BottomNavController extends GetxController implements GetxService {
  int currentIndex = 0;
  String categoryLabel = "Groceries";
  bool _shouldResetCategory = false;

  void changeTab(int index) {
    if (index == 1) {
      final categoryCtrl = Get.find<CategoryController>();
      if (_shouldResetCategory || currentIndex != 1) {
        categoryNavigatorKey.currentState?.pushAndRemoveUntil(
          getCustomRoute(
            child: SubcategoryPage(
              mainCategory: categoryCtrl.selectedMainCategory,
            ),
          ),
          (route) => false,
        );
        _shouldResetCategory = false;
      }
      currentIndex = 1;
    } else {
      _shouldResetCategory = true;
      currentIndex = index;
    }

    update();
  }

  void updateCategoryLabel(String newLabel) {
    categoryLabel = newLabel;

    final categoryCtrl = Get.find<CategoryController>();
    categoryCtrl.updateMainCategory(newLabel);

    categoryNavigatorKey.currentState?.pushAndRemoveUntil(
      getCustomRoute(
        child: SubcategoryPage(
          mainCategory: newLabel,
        ),
      ),
      (route) => false,
    );

    currentIndex = 1;
    update(); // Notify UI
  }
}
