import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/modules/splash/splash_binding.dart';
import 'package:getx_pattern_course/app/modules/splash/splash_page.dart';
import 'package:getx_pattern_course/routes/pages.dart';
import 'package:getx_pattern_course/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: Pages.pages,
    );
  }
}
