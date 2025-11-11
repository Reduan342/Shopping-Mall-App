import 'package:business_apk/utils/app_textstyle.dart';
import 'package:business_apk/view/catagory_chips.dart';
import 'package:business_apk/view/filter_bottom_sheet.dart';
import 'package:business_apk/view/product_grid.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDrak = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shopping',
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
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 16),
          child: CategoryChips(),
          ),
          Expanded(child: ProductGrid())
        ],
      ),
    );
  }
}
