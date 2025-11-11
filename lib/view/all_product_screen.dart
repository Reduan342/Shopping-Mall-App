import 'package:business_apk/utils/app_textstyle.dart';
import 'package:business_apk/view/filter_bottom_sheet.dart';
import 'package:business_apk/view/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDrak = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          //icon
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDrak ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'All Products',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDrak ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          //Search Icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDrak ? Colors.white : Colors.black,
            ),
          ),
          //filter icon
          IconButton(
            onPressed: () => FilterBottomSheet.show(context),
            icon: Icon(
              Icons.filter_list,
              color: isDrak ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
