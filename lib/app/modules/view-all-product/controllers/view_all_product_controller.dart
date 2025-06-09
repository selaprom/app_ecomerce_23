import 'package:flutter_ecomerce_23/app/data/models/all_productres_model.dart';
import 'package:flutter_ecomerce_23/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ViewAllProductController extends GetxController {
  final _provider = Get.find<APIProvider>();
  RxList<AllProduct> products = RxList();

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    final proId = Get.arguments['cate_id'];
    final response = await _provider.getProByCate(proId);
    if (response.statusCode == 200) {
      final lstProducts = response.data as List;
      products.value =
          lstProducts.map((pro) => AllProduct.fromJson(pro)).toList();
      print("Product $products");
    } else {
      Get.defaultDialog(title: "error");
    }
  }
}
