import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_23/app/modules/notification/bindings/notification_binding.dart';
import 'package:flutter_ecomerce_23/app/modules/notification/views/notification_view.dart';
import 'package:flutter_ecomerce_23/app/modules/product/bindings/product_binding.dart';
import 'package:flutter_ecomerce_23/app/modules/product/views/product_view.dart';
import 'package:flutter_ecomerce_23/app/modules/sample/bindings/sample_binding.dart';
import 'package:flutter_ecomerce_23/app/modules/sample/views/sample_view.dart';
import 'package:flutter_ecomerce_23/app/modules/search_product/bindings/search_product_binding.dart';
import 'package:flutter_ecomerce_23/app/modules/search_product/views/search_product_view.dart';
import 'package:flutter_ecomerce_23/app/modules/setting/bindings/setting_binding.dart';
import 'package:flutter_ecomerce_23/app/modules/setting/views/setting_view.dart';
import 'package:flutter_ecomerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.PRODUCT) {
      return GetPageRoute(
        settings: settings,
        page: () => ProductView(),
        binding: ProductBinding(),
      );
    }
    if (settings.name == Routes.SEARCH_PRODUCT) {
      return GetPageRoute(
        settings: settings,
        page: () => SearchProductView(),
        binding: SearchProductBinding(),
      );
    }
    if (settings.name == Routes.NOTIFICATION) {
      return GetPageRoute(
        settings: settings,
        page: () => NotificationView(),
        binding: NotificationBinding(),
      );
    }
    if (settings.name == Routes.SETTING) {
      return GetPageRoute(
        settings: settings,
        page: () => SettingView(),
        binding: SettingBinding(),
      );
    }
    if (settings.name == Routes.SETTING) {
      return GetPageRoute(
        settings: settings,
        page: () => SettingView(),
        binding: SettingBinding(),
      );
    }
    if (settings.name == Routes.SAMPLE) {
      return GetPageRoute(
        settings: settings,
        page: () => SampleView(),
        binding: SampleBinding(),
      );
    }
  }

  MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (logic) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('MainView'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(onPressed: controller.logout, icon: Icon(Icons.logout))
        //   ],
        // ),
        body: Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: onGenerateRoute,
          initialRoute: Routes.PRODUCT,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: controller.onChangePage,
            currentIndex: controller.currentindex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_on_outlined),
                  label: "notification"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "setting"),
            ]),
      );
    });
  }
}
