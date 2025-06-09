import 'package:flutter/widgets.dart';
import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/providers/api_provider.dart';

class LoginController extends GetxController {
  final _apiProvider = Get.find<APIProvider>();
  final box = GetStorage();
  void login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await _apiProvider.login(email: email, password: password);
      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];
        box.write('token', accessToken);
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.defaultDialog(
            title: "message", content: Text("error ${response.statusCode}"));
        print("========================== ${response.statusCode}");
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
