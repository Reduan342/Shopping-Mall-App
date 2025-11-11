import 'package:business_apk/utils/app_textstyle.dart';
import 'package:business_apk/models/products.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

   
    final double discountedPrice = product.oldPrice * (1 - product.discountPercent / 100);

    return Container(
      constraints: BoxConstraints(maxHeight: screenWidth * 0.9),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    product.image1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    product.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavourite
                        ? Theme.of(context).primaryColor
                        : isDark ? Colors.grey[400] : Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
              if (product.discountPercent > 0)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${product.discountPercent.toStringAsFixed(0)}% OFF',
                      style: AppTextstyle.withColor(
                        AppTextstyle.withWeight(AppTextstyle.bodySmall, FontWeight.bold),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextstyle.withColor(
                    AppTextstyle.withWeight(AppTextstyle.h3, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  product.category,
                  style: AppTextstyle.withColor(
                    AppTextstyle.labelMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Text(
                      '\$${discountedPrice.toStringAsFixed(2)}',
                      style: AppTextstyle.withColor(
                        AppTextstyle.withWeight(AppTextstyle.bodyLarge, FontWeight.bold),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    if (product.discountPercent > 0)
                      Text(
                        '\$${product.oldPrice.toStringAsFixed(2)}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.bodySmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
