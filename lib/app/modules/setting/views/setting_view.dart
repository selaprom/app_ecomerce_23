import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SettingView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
              subtitle: Text("View your profile"),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
            ),
            ListTile(
              onTap: controller.logout,
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              //subtitle: Text("View your profile"),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_outlined)),
            )
          ],
        ));
  }
}
