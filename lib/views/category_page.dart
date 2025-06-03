// pages/category_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/category_controller.dart';
import '../main.dart';
import 'subcategory_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController categoryCtrl = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    log("Category Page",name:"Category Page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // key: Get.nestedKey(1),
      key: categoryNavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Obx(() => SubcategoryPage(
            mainCategory: categoryCtrl.selectedMainCategory.value,
          )),
        );
      },
    );
  }
}

