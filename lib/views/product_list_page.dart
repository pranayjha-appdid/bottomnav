// pages/product_list_page.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbottom/services/route_helper.dart';
import '../main.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  final String subCategory;
  ProductListPage({required this.subCategory});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ScrollController _scrollController = ScrollController();
  List<String> products = [];
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchProducts();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
    //     fetchProducts();
    //   }
    // });
    log("Product List Page", name: "Product List Page");
  }

  void fetchProducts() async {
    if (isLoading) return;
    isLoading = true;
    await Future.delayed(Duration(seconds: 1)); // Simulate network
    List<String> newProducts = List.generate(
        10, (i) => "${widget.subCategory} Item ${(page - 1) * 10 + i + 1}");
    setState(() {
      products.addAll(newProducts);
      page++;
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subCategory)),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: products.length + 1,
        itemBuilder: (_, index) {
          if (index == products.length) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircularProgressIndicator(),
            ));
          }
          String product = products[index];
          return ListTile(
            title: Text(product),
            onTap: () {
              categoryNavigatorKey.currentState?.push(
                getCustomRoute(
                  child: ProductDetailPage(productName: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
