import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isloading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.user.value == null) {
            return Center(
              child: Column(
                children: [
                  Text("Guest"),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ],
              ),
            );
          }
          final user = controller.user.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.user.value!.avatar == null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage(controller.user.value!.avatar!),
                    ),
              ListTile(
                title: Text("Name"),
                subtitle: Text(user!.name ?? ""),
              ),
              ListTile(
                title: Text("Email"),
                subtitle: Text(user.email ?? ""),
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          );
        }));
  }
}
