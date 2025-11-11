import 'package:business_apk/controllers/auto_controller.dart';
import 'package:business_apk/controllers/navigation_controller.dart';
import 'package:business_apk/controllers/theme_controller.dart';
import 'package:business_apk/utils/app_themes.dart';
import 'package:business_apk/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AutoController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr Store',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: Screen(),
    );
  }
}
//1:27:15