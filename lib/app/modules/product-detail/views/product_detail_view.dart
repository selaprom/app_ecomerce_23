import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/productres.model.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProductDetailView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Image.network("${product.image}" ?? ""),
            Text(
              "${product.name}" ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "\$${product.price}" ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                )),
            Text(
              "${product.description}" ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            )
          ],
        ));
  }
}
