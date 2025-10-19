import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/core/extentions/extentions.dart'; // Import extensions
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/routes/my_routes.dart'; // Import routes
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/home/data/models/products_response.dart'; // Import Product model
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  // Modify the constructor to accept a Product object
  final Product product;
  final double horizontalPadding;
  final double verticalPadding;

  const ProductCard({
    super.key,
    required this.product, // Changed
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
      // Wrap with InkWell for navigation
      child: InkWell(
        onTap: () {
          context.pushNamed(MyRoutes.productDetails, arguments: product);
        },
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 180.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: product.coverPictureUrl, // Use product.
                  width: double.maxFinite,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              verticalSapce(5), // Added for spacing
              Text(
                product.name, // Use product.
                style: MyTextStyle.font14w600Black,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSapce(2), // Added for spacing
              Text(
                product.description, // Use product.
                style: MyTextStyle.font14w400Grey,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSapce(2), // Added for spacing
              Text(
                '\$ ${product.price.toInt()} USD', // Use product.
                style: MyTextStyle.font14w400Black,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
