import 'package:business_apk/controllers/auto_controller.dart';
import 'package:business_apk/utils/app_textstyle.dart';
import 'package:business_apk/view/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OneScreenItem> _items = [
    OneScreenItem(
      title: "Explore the newest fashion house and find your unique Style",
      description: 'Discover Latest Trends',
      image: 'assets/images/intro.png',
    ),

    //
    OneScreenItem(
      title: "Shop Premium Quality Products from top brands",
      description: 'Quality Products',
      image: 'assets/images/intro1.png',
    ),

    //
    OneScreenItem(
      title: "Simple & Secure Shoping experinence",
      description: 'Easy Shoping',
      image: 'assets/images/intro2.png',
    ),
  ];

  //started button pressed
  void _handleGetStated() {
    final AutoController autoController = Get.find<AutoController>();
    autoController.setFirstTimeDone();
    Get.off(() =>  SignScreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyle.withColor(
                      AppTextstyle.h1,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyLarge,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300,
                  ), // fixed microseconds -> milliseconds
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _handleGetStated(),
                  child: Text(
                    'skip',
                    style: AppTextstyle.buttonMedium.copyWith(
                      color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetStated();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Next' : 'Get Stated',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OneScreenItem {
  final String image;
  final String title;
  final String description;

  OneScreenItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
