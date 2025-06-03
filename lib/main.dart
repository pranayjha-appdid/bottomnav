import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/views/category_page.dart';
import 'package:testappbottom/views/custom_exit_dailogue.dart';
import 'package:testappbottom/views/home_page.dart';
import 'package:testappbottom/views/orders_page.dart';
import 'package:testappbottom/views/wishlist_page.dart';
import 'controller/bottom_nav_controller.dart';
import 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Init().initialize();

  runApp(GetMaterialApp(
      navigatorKey: navigatorKey,

      home: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> categoryNavigatorKey =
    GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    OrdersPage(),
    WishlistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) => PopScope(
        // canPop: false,
        // onPopInvoked: (didPop) async {
        //   if (!didPop) {
        //     final shouldExit = await showDialog<bool>(
        //       context: context,
        //       builder: (context) => const CustomExitDialog(),
        //     );
        //
        //     if (shouldExit == true) {
        //       exit(0);
        //     }
        //   }
        // },
        child: Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: controller.currentIndex,
            onTap: controller.changeTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: controller.categoryLabel,
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Orders',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Wishlist',
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
