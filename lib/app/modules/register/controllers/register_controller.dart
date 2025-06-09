import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_23/app/data/providers/api_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final _imagePicker = ImagePicker();
  File? image;
  final _apiProvider = Get.find<APIProvider>();

  void pickimage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
      update();
    }
  }

  void register({
    required String email,
    required String name,
    required String password,
    required String confirmpass,
  }) async {
    try {
      final response = await _apiProvider.signup(
          email: email,
          name: name,
          password: password,
          confirmpass: confirmpass,
          image: image);
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "Success",
            content: Text("You Register Successful"),
            confirm: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok")));
      } else {
        Get.defaultDialog(
            title: "Register Failed", content: Text("Failed to Signup"));
        print("Errorrrrrrrrrrrrrr ${response.statusCode}");
      }
    } catch (e) {
      Get.defaultDialog(
          title: "Register Failed", content: Text("Failed to Signup"));
      print("Errorrrrrrrrrrrrrr ${e.toString()}");
    }
  }
}
