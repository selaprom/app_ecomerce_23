import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomerce_23/app/data/models/user.res.model.dart';
import 'package:flutter_ecomerce_23/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _provider = Get.find<APIProvider>();
  Rx<User?> user = Rx(null);
  var isloading = false.obs;
  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() async {
    try {
      isloading.value = true;
      final response = await _provider.getCurrentUserLogin();
      print("Respone $response");
      if (response.statusCode == 200) {
        user.value = User.fromJson(response.data);
      } else {
        Get.defaultDialog(
          title: "message",
          content: Text("Fail to get user"),
        );
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text("error ${e.toString()}"));
    } finally {
      isloading.value = false;
    }
  }
}
