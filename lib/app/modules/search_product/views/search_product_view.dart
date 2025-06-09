import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  SearchProductView({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SearchProductView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text("Search"),
                        hintText: "Search",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search)),
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      controller.searchProduct(value);
                    },
                  ),
                ),
              ),
              Obx(() => Expanded(
                    child: ListView.builder(
                      itemCount: controller.lstProducts.value.length,
                      itemBuilder: (context, index) {
                        final product = controller.lstProducts.value[index];
                        return Column(
                          children: [
                            Image.network(product.image!),
                            Text("${product.name}")
                          ],
                        );
                      },
                    ),
                  ))
            ],
          ),
        ));
  }
}
