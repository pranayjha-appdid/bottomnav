import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testappbottom/controller/bottom_nav_controller.dart';
import 'package:testappbottom/controller/category_controller.dart';

class Init {
  initialize() async {

    try {
      ///--------Repo-------------


      ///-------Controllers--------
      Get.lazyPut(() => BottomNavController());
      Get.lazyPut(() => CategoryController());


    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }

}