import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  // Get Cart States
  const factory CartState.getCartLoading() = GetCartLoading;
  const factory CartState.getCartSuccess(GetCartResponse cartData) =
      GetCartSuccess;
  const factory CartState.getCartFailure(String message) = GetCartFailure;

  // Add Item States
  const factory CartState.addItemLoading() = AddItemLoading;
  const factory CartState.addItemSuccess(String message) =
      AddItemSuccess; // Simplified to message
  const factory CartState.addItemFailure(String message) = AddItemFailure;

  // Update Item States
  const factory CartState.updateItemLoading(String itemId) =
      UpdateItemLoading; // Track which item is loading
  const factory CartState.updateItemSuccess() =
      UpdateItemSuccess; // Just signal success
  const factory CartState.updateItemFailure(String message) = UpdateItemFailure;

  // Delete Item States
  const factory CartState.deleteItemLoading(String itemId) =
      DeleteItemLoading; // Track which item is loading
  const factory CartState.deleteItemSuccess() =
      DeleteItemSuccess; // Just signal success
  const factory CartState.deleteItemFailure(String message) = DeleteItemFailure;
}
