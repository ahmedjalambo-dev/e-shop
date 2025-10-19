import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/cart/cubit/cart_state.dart';
import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:eshop/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  GetCartResponse? _currentCart; // Cache the current cart data

  CartCubit(this._cartRepo) : super(const CartState.initial());

  // Method to fetch the cart
  Future<void> getCart() async {
    emit(const CartState.getCartLoading());
    final result = await _cartRepo.getCart();
    result.when(
      success: (cartData) {
        _currentCart = cartData; // Cache the data
        emit(CartState.getCartSuccess(cartData));
      },
      failure: (error) {
        emit(
          CartState.getCartFailure(
            error.apiErrorModel.message ?? 'Failed to load cart',
          ),
        );
      },
    );
  }

  // Updated Add Item method
  void addItemToCart({required String productId, int quantity = 1}) async {
    emit(const CartState.addItemLoading());
    final result = await _cartRepo.addItemToCart(
      productId: productId,
      quantity: quantity,
    );
    result.when(
      success: (addItemResponse) {
        emit(CartState.addItemSuccess(addItemResponse.message ?? 'Item added'));
        getCart(); // Refresh cart after adding
      },
      failure: (error) {
        emit(
          CartState.addItemFailure(
            error.apiErrorModel.message ?? 'Failed to add item',
          ),
        );
      },
    );
  }

  // Method to update item quantity
  void updateItemQuantity({
    required String itemId,
    required int quantity,
  }) async {
    // Prevent updating quantity below 1 or if it's the same
    final item = _currentCart?.cartItems.firstWhere(
      (item) => item.itemId == itemId,
    );
    if (item == null || quantity < 1 || item.quantity == quantity) return;

    emit(CartState.updateItemLoading(itemId)); // Indicate which item is loading
    final result = await _cartRepo.updateCartItem(
      itemId: itemId,
      quantity: quantity,
    );
    result.when(
      success: (_) {
        emit(const CartState.updateItemSuccess());
        getCart(); // Refresh cart after updating
      },
      failure: (error) {
        emit(
          CartState.updateItemFailure(
            error.apiErrorModel.message ?? 'Failed to update item',
          ),
        );
      },
    );
  }

  // Method to remove item
  void deleteItem({required String itemId}) async {
    emit(CartState.deleteItemLoading(itemId)); // Indicate which item is loading
    final result = await _cartRepo.deleteCartItem(itemId: itemId);
    result.when(
      success: (_) {
        emit(const CartState.deleteItemSuccess());
        getCart(); // Refresh cart after deleting
      },
      failure: (error) {
        emit(
          CartState.deleteItemFailure(
            error.apiErrorModel.message ?? 'Failed to delete item',
          ),
        );
      },
    );
  }

  // Helper to calculate total
  double calculateTotalPrice() {
    if (_currentCart == null) return 0.0;
    return _currentCart!.cartItems.fold(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );
  }
}
