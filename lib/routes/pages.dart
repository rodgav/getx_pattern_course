import 'package:get/get.dart';
import 'package:getx_pattern_course/app/modules/detail/detail_binding.dart';
import 'package:getx_pattern_course/app/modules/detail/detail_view.dart';
import 'package:getx_pattern_course/app/modules/home/home_binding.dart';
import 'package:getx_pattern_course/app/modules/home/home_view.dart';
import 'package:getx_pattern_course/app/modules/login/login_binding.dart';
import 'package:getx_pattern_course/app/modules/login/login_page.dart';
import 'package:getx_pattern_course/app/modules/splash/splash_binding.dart';
import 'package:getx_pattern_course/app/modules/splash/splash_page.dart';
import 'package:getx_pattern_course/routes/routes.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.DETAIL,
        page: () => DetailPage(),
        binding: DetailBinding()),
  ];
}
