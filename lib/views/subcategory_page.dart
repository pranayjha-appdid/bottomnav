// pages/subcategory_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/services/route_helper.dart';
import '../controller/category_controller.dart';
import '../main.dart';
import 'product_list_page.dart';

class SubcategoryPage extends StatefulWidget {
  final String mainCategory;
  SubcategoryPage({required this.mainCategory});

  @override
  State<SubcategoryPage> createState() => _SubcategoryPageState();
}

class _SubcategoryPageState extends State<SubcategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    log("SubCategory Page",name:"SubCategory Page");
    super.initState();
  }


  final CategoryController categoryCtrl = Get.find();

  final Map<String, List<String>> subCategories = {
    "Groceries": ["Daily Essentials", "Food", "Snacks"],
    "Freshmart": ["Fruits", "Vegetables", "Dairy"],
    "Restaurant": ["Indian", "Chinese", "Italian"],
    "Food": ["Packaged", "Ready to Eat"],
    "Medicine": ["OTC", "Prescriptions"]
  };

  @override
  Widget build(BuildContext context) {
    final subs = subCategories[widget.mainCategory] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(widget.mainCategory)),
      body: ListView.builder(
        itemCount: subs.length,
        itemBuilder: (_, index) {
          String subCat = subs[index];
          return ListTile(
            title: Text(subCat),
            onTap: () {
              categoryCtrl.updateSubCategory(subCat);
              categoryNavigatorKey.currentState?.push(
                getCustomRoute(
                  child:  ProductListPage(subCategory: subCat),
                ),
              );

            },
          );
        },
      ),
    );
  }
}
