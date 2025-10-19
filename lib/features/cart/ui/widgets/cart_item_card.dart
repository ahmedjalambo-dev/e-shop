import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/features/cart/cubit/cart_cubit.dart';
import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  final CartItemResponse item;
  final bool isUpdating; // To show loading state on the specific item
  final bool isDeleting; // To show loading state on the specific item

  const CartItemCard({
    super.key,
    required this.item,
    this.isUpdating = false,
    this.isDeleting = false,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: MyColor.mylightestGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: item.productCoverUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator(strokeWidth: 2)),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 40.sp),
            ),
          ),
          horizontalSapce(12),
          // Details and Controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: MyTextStyle.font16w500Grey.copyWith(
                    color: MyColor.myBlack,
                  ), // Adjusted style
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSapce(4),
                Text(
                  '\$${item.finalPricePerUnit.toStringAsFixed(2)}', // Price per unit
                  style: MyTextStyle.font14w500Black,
                ),
                verticalSapce(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Controls
                    Row(
                      children: [
                        _buildQuantityButton(
                          icon: Icons.remove,
                          onPressed: isUpdating || isDeleting
                              ? null
                              : () => cartCubit.updateItemQuantity(
                                  itemId: item.itemId,
                                  quantity: item.quantity - 1,
                                ),
                        ),
                        horizontalSapce(8),
                        isUpdating
                            ? SizedBox(
                                width: 16.w,
                                height: 16.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                item.quantity.toString(),
                                style: MyTextStyle.font14w500Black,
                              ),
                        horizontalSapce(8),
                        _buildQuantityButton(
                          icon: Icons.add,
                          onPressed: isUpdating || isDeleting
                              ? null
                              : () => cartCubit.updateItemQuantity(
                                  itemId: item.itemId,
                                  quantity: item.quantity + 1,
                                ),
                        ),
                      ],
                    ),
                    // Delete Button
                    isDeleting
                        ? SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.redAccent,
                              size: 24.sp,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: isUpdating
                                ? null
                                : () =>
                                      cartCubit.deleteItem(itemId: item.itemId),
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

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: onPressed != null
              ? MyColor.myGrey.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16.sp,
          color: onPressed != null ? MyColor.myBlack : Colors.grey,
        ),
      ),
    );
  }
}
