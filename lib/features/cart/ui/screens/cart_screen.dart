import 'package:eshop/core/di/injection.dart';
import 'package:eshop/core/helpers/spaceing_helper.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:eshop/core/widgets/my_text_button.dart';
import 'package:eshop/features/cart/cubit/cart_cubit.dart';
import 'package:eshop/features/cart/cubit/cart_state.dart';
import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:eshop/features/cart/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure Cubit is provided if not already available higher up
    // Typically done in MyRoot or where the BottomNavBar is managed
    final cartCubit = getIt<CartCubit>();

    // Fetch cart when the screen is built (if not already fetched)
    // Consider fetching when the Cart tab is selected in MyRoot
    if (cartCubit.state == const CartState.initial()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cartCubit.getCart();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: MyTextStyle.font22w500Black),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        // Use BlocConsumer for listening to update/delete results
        bloc: cartCubit, // Explicitly provide the bloc instance
        listenWhen: (previous, current) =>
            current is UpdateItemSuccess ||
            current is UpdateItemFailure ||
            current is DeleteItemSuccess ||
            current is DeleteItemFailure,
        listener: (context, state) {
          state.whenOrNull(
            // Handle feedback for background operations
            updateItemFailure: (message) =>
                _showErrorSnackBar(context, message),
            deleteItemFailure: (message) =>
                _showErrorSnackBar(context, message),
            // Success feedback is implicitly handled by the UI rebuilding via getCart()
          );
        },
        buildWhen: (previous, current) =>
            current is GetCartLoading ||
            current is GetCartSuccess ||
            current is GetCartFailure,
        builder: (context, state) {
          return state.maybeWhen(
            getCartLoading: () =>
                const Center(child: CircularProgressIndicator()),
            getCartFailure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message, style: MyTextStyle.font16w500Grey),
                  verticalSapce(10),
                  ElevatedButton(
                    onPressed: () => cartCubit.getCart(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            getCartSuccess: (cartData) {
              if (cartData.cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'Your cart is empty!',
                    style: MyTextStyle.font18w600Black,
                  ),
                );
              }
              return _buildCartContent(context, cartCubit, cartData);
            },
            orElse: () => const Center(
              child: Text('Something went wrong'),
            ), // Or handle initial state
          );
        },
      ),
    );
  }

  Widget _buildCartContent(
    BuildContext context,
    CartCubit cartCubit,
    GetCartResponse cartData,
  ) {
    final totalPrice = cartCubit.calculateTotalPrice(); // Use helper method

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: cartData.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartData.cartItems[index];
              // Check loading state for specific item
              bool isUpdating = cartCubit.state.maybeWhen(
                updateItemLoading: (loadingItemId) =>
                    loadingItemId == item.itemId,
                orElse: () => false,
              );
              bool isDeleting = cartCubit.state.maybeWhen(
                deleteItemLoading: (loadingItemId) =>
                    loadingItemId == item.itemId,
                orElse: () => false,
              );
              return CartItemCard(
                item: item,
                isUpdating: isUpdating,
                isDeleting: isDeleting,
              );
            },
          ),
        ),
        // Summary and Checkout Button
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, -3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal:', style: MyTextStyle.font16w500Grey),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: MyTextStyle.font18w600Black,
                  ),
                ],
              ),
              verticalSapce(15),
              MyTextButton(
                text: 'Proceed to Checkout',
                textStyle: MyTextStyle.font14w500White,
                onPressed: () {
                  // TODO: Implement checkout navigation/logic
                  print('Proceeding to checkout');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
