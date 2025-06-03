// pages/product_detail_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testappbottom/main.dart';
import 'package:testappbottom/services/route_helper.dart';

import 'caart_page.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  ProductDetailPage({required this.productName});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    log("Product Details Page", name: "Product Details Page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.productName)),
      body: Center(
        child: Column(
          children: [
            Text("Details of ${widget.productName}",
                style: TextStyle(fontSize: 20)),
            TextButton(
                onPressed: () {
                  Navigator.push(navigatorKey.currentState!.context, getCustomRoute(child: CaartPage()));
                },
                child: Text("Cart Button"))
          ],
        ),
      ),
    );
  }
}
