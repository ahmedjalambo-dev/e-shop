import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/core/di/injection.dart'; // Import GetIt instance
import 'package:eshop/core/extentions/extentions.dart'; // For context.pop()
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_color.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/cart/cubit/cart_cubit.dart'; // Import CartCubit
import 'package:eshop/features/cart/cubit/cart_state.dart'; // Import CartState
import 'package:eshop/features/home/data/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocProvider
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Provide the CartCubit if it's not provided higher up
    return BlocProvider.value(
      // Or BlocProvider(create: (_) => getIt<CartCubit>()) if needed
      value: getIt<CartCubit>(), // Use existing instance from GetIt
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details', style: MyTextStyle.font22w500Black),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: product.coverPictureUrl,
                          width: double.maxFinite,
                          height: 350.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: MyColor.myBlack,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      verticalSapce(20),

                      // Product Name
                      Text(product.name, style: MyTextStyle.font28w800Black),
                      verticalSapce(10),

                      // Product Price
                      Text(
                        '\$ ${product.price.toStringAsFixed(2)} USD',
                        style: MyTextStyle.font22w500Black.copyWith(
                          color: MyColor.myGrey,
                        ),
                      ),
                      verticalSapce(20),

                      // Product Description
                      Text(
                        product.description,
                        style: MyTextStyle.font14w400Grey,
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Add to Cart Button and Listener
              BlocListener<CartCubit, CartState>(
                listener: (context, state) {
                  state.whenOrNull(
                    addItemLoading: () {
                      // Show loading indicator (optional, could be on the button)
                      showDialog(
                        context: context,
                        barrierDismissible: false, // Prevent dismissing
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
                    addItemSuccess: (message) {
                      // The variable is the message string
                      context.pop(); // Dismiss loading dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message), // Use the string directly
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    addItemFailure: (message) {
                      context.pop(); // Dismiss loading dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message.toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: BlocBuilder<CartCubit, CartState>(
                    // To disable button while loading
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        addItemLoading: () => true,
                        orElse: () => false,
                      );
                      return MyTextButton(
                        text: isLoading ? 'Adding...' : 'Add to Cart',
                        textStyle: MyTextStyle.font14w500White,
                        // Disable button when loading
                        onPressed: isLoading
                            ? () {}
                            : () {
                                context.read<CartCubit>().addItemToCart(
                                  productId: product.id,
                                  // quantity: 1, // Default quantity or allow user selection
                                );
                              },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
