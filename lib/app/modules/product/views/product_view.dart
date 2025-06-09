import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_23/app/modules/product-detail/views/product_detail_view.dart';
import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProductView'),
          centerTitle: true,
        ),
        body: Obx(() => Padding(
              padding: const EdgeInsets.all(20),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getProduct();
                },
                child: ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final category = controller.products[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category.categoryName ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.VIEW_ALL_PRODUCT,
                                      arguments: {
                                        'cate_id': category.categoryId,
                                      });
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 320,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: category.products == null
                                    ? 0
                                    : category.products!.length,
                                itemBuilder: (context, index) {
                                  final product = category.products![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => ProductDetailView(
                                            product: product,
                                          ));
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child:
                                                Image.network(product.image!)),
                                        Text("\$${product.price}"),
                                        Text("${product.description}")
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }),
              ),
            )));
  }
}
