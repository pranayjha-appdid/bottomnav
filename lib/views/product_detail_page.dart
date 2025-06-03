// pages/product_detail_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';

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
        child: Text("Details of ${widget.productName}",
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
