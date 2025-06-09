import 'package:flutter_ecomerce_23/app/data/models/productres.model.dart';
import 'package:flutter_ecomerce_23/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final _provider = Get.find<APIProvider>();
  RxList<ProductRes> products = RxList();
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    final response = await _provider.getProduct();
    if (response.statusCode == 200) {
      final lstProducts = response.data as List;
      products.value =
          lstProducts.map((pro) => ProductRes.fromJson(pro)).toList();
      print("Product $products");
    } else {
      Get.defaultDialog(title: "error");
    }
  }
}
