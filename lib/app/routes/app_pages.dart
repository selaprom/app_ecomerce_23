import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/sample/bindings/sample_binding.dart';
import '../modules/sample/views/sample_view.dart';
// import '../modules/search-product/bindings/search_product_binding.dart';
// import '../modules/search-product/views/search_product_view.dart';
import '../modules/search_product/bindings/search_product_binding.dart';
import '../modules/search_product/views/search_product_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/view-all-product/bindings/view_all_product_binding.dart';
import '../modules/view-all-product/views/view_all_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      // middlewares: [
      //   MainMiddleware(),
      // ],
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT,
      page: () => SearchProductView(),
      binding: SearchProductBinding(),
      // children: [
      //   GetPage(
      //     name: _Paths.SEARCH_PRODUCT,
      //     page: () => const SearchProductView(),
      //     binding: SearchProductBinding(),
      //   ),
      // ],
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SAMPLE,
      page: () => const SampleView(),
      binding: SampleBinding(),
    ),
    // GetPage(
    //   name: _Paths.PRODUCT_DETAIL,
    //   page: () => const ProductDetailView(),
    //   binding: ProductDetailBinding(),
    // ),
    GetPage(
      name: _Paths.VIEW_ALL_PRODUCT,
      page: () => const ViewAllProductView(),
      binding: ViewAllProductBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
