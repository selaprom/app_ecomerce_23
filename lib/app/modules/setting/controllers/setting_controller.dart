import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  void logout() async {
    final token = box.read('token');
    if (token == null) {
      Get.offAllNamed(Routes.LOGIN);
      return;
    }
    box.remove('token');
    //go to login view
    Get.offAllNamed(Routes.LOGIN);
  }
}
