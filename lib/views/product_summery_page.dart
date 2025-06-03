import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testappbottom/services/route_helper.dart';

import '../controller/bottom_nav_controller.dart';
import '../main.dart';

class ProductSummeryPage extends StatefulWidget {
  const ProductSummeryPage({super.key});

  @override
  State<ProductSummeryPage> createState() => _ProductSummeryPageState();
}

class _ProductSummeryPageState extends State<ProductSummeryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Order Summery Page"),
            TextButton(
                onPressed: () {
                  final bottomNavCtrl = Get.find<BottomNavController>();
                  bottomNavCtrl.currentIndex = 0;
                  bottomNavCtrl.update();

                  navigatorKey.currentState?.pushAndRemoveUntil(
                    getCustomRoute(child: MyApp()),
                        (route) => false,
                  );

                },
                child: Text("Order Completed"))
          ],
        ),
      ),
    );
  }
}
