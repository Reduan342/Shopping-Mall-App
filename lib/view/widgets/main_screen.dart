import 'package:business_apk/controllers/navigation_controller.dart';
import 'package:business_apk/controllers/theme_controller.dart';
import 'package:business_apk/view/account_screen.dart';
import 'package:business_apk/view/custom_bottom_navbar.dart';
import 'package:business_apk/view/home_screen.dart';
import 'package:business_apk/view/shopping_screen.dart';
import 'package:business_apk/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
