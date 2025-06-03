// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/views/category_page.dart';
import 'package:testappbottom/views/home_page.dart';
import 'package:testappbottom/views/orders_page.dart';
import 'package:testappbottom/views/wishlist_page.dart';
import 'controller/bottom_nav_controller.dart';
import 'controller/category_controller.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> categoryNavigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  final BottomNavController bottomNavCtrl = Get.put(BottomNavController());
  final CategoryController categoryCtrl = Get.put(CategoryController());

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    OrdersPage(),
    WishlistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

          body: IndexedStack(
            index: bottomNavCtrl.currentIndex.value,
            children: pages,
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                backgroundColor: Colors.black,
                currentIndex: bottomNavCtrl.currentIndex.value,
                onTap: bottomNavCtrl.changeTab,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: bottomNavCtrl.categoryLabel.value,
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.receipt),
                      label: 'Orders',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Wishlist',
                      backgroundColor: Colors.black),
                ],
              )),
        ));
  }
}
