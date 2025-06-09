import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final box = GetStorage();
  var currentindex = 0;
  void logout() {
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }

  // void onTab(int index) {
  //   currentindex = index;
  //   update();
  // }

  final pages = [
    Routes.PRODUCT,
    Routes.SEARCH_PRODUCT,
    Routes.NOTIFICATION,
    Routes.SETTING,
  ];
  void onChangePage(int index) {
    currentindex = index;
    update();
    Get.offAllNamed(pages[index], id: 1);
  }
}
