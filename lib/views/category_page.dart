// pages/category_page.dart
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/services/route_helper.dart';
import '../controller/category_controller.dart';
import '../main.dart';
import 'custom_exit_dailogue.dart';
import 'subcategory_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    // log("Category Page", name: "Category Page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      onPopInvoked: (didPop) async {
        if (!didPop) {
          final canPop = categoryNavigatorKey.currentState?.canPop() ?? false;
          if (canPop) {
            categoryNavigatorKey.currentState?.pop();
          } else {
            final shouldExit = await showDialog<bool>(
                      context: context,
                      builder: (context) => const CustomExitDialog(),
                    );

                    if (shouldExit == true) {
                      exit(0);
                    }
          }
        }
      },
      child: Navigator(
        key: categoryNavigatorKey,
        onGenerateRoute: (settings) {
          return getCustomRoute(
            child: GetBuilder<CategoryController>(
              builder: (controller) => SubcategoryPage(
                mainCategory: controller.selectedMainCategory,
              ),
            ),
          );
        },
      ),
    );
  }
}
