import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String productImageUrl;
  final String productName;
  final String productDes;
  final int productPrice;
  final double horizontalPadding;
  final double verticalPadding;
  const ProductCard({
    super.key,
    required this.productImageUrl,
    required this.productName,
    required this.productDes,
    required this.productPrice,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: SizedBox(
        width: 180.w,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: productImageUrl,
                width: double.maxFinite,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              productName,
              style: MyTextStyle.font14w600Black,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              productDes,
              style: MyTextStyle.font14w400Grey,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$ $productPrice USD',
              style: MyTextStyle.font14w400Black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
