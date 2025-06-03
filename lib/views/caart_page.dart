import 'package:flutter/material.dart';
import 'package:testappbottom/views/product_summery_page.dart';

import '../services/route_helper.dart';

class CaartPage extends StatefulWidget {
  const CaartPage({super.key});

  @override
  State<CaartPage> createState() => _CaartPageState();
}

class _CaartPageState extends State<CaartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text("CartPages"),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, getCustomRoute(child: ProductSummeryPage()));
                  },
                  child: Text("Order Summery PAge"))
            ],
          ),
        ),
      ),
    );
  }
}
