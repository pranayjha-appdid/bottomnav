// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bottom_nav_controller.dart';
import '../controller/category_controller.dart';


class HomePage extends StatelessWidget {
  final BottomNavController bottomNavCtrl = Get.find();
  final CategoryController categoryCtrl = Get.find();

  final List<String> categories = [
    'Food',
    'Groceries',
    'Restaurant',
    'Medicine',
    'Freshmart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (_, index) {
          String cat = categories[index];
          return GestureDetector(
            onTap: () {
              categoryCtrl.updateMainCategory(cat);
              bottomNavCtrl.updateCategoryLabel(cat);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(cat, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
