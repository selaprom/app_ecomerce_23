import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/view_all_product_controller.dart';

class ViewAllProductView extends GetView<ViewAllProductController> {
  const ViewAllProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ViewAllProductView'),
          centerTitle: true,
        ),
        body: Obx(() => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 400),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(product.image!),
                    Text(product.name ?? ""),
                    Text(
                      "\$${product.price}" ?? "",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(product.description ?? "")
                  ],
                ),
              );
            })));
  }
}
