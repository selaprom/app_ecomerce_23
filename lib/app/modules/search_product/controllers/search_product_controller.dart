import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/searchproduct.model.dart';
import '../../../data/providers/api_provider.dart';

class SearchProductController extends GetxController {
  final _provider = Get.find<APIProvider>();
  RxList<ProductSearchResult> lstProducts = RxList();

  void searchProduct(String name) async {
    try {
      final response = await _provider.searchProduct(name);
      if (response.statusCode == 200) {
        final products = response.data as List;
        lstProducts.value =
            products.map((e) => ProductSearchResult.fromJson(e)).toList();
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()));
    }
  }
}
