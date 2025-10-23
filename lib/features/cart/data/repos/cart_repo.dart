import 'package:eshop/core/netowoks/api_error_handler.dart';
import 'package:eshop/core/netowoks/api_result.dart';
import 'package:eshop/features/cart/data/models/add_item_to_cart_request_body.dart';
import 'package:eshop/features/cart/data/models/add_item_to_cart_response.dart';
import 'package:eshop/features/cart/data/models/delete_item_request_body.dart';
import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:eshop/features/cart/data/models/update_item_request_body.dart';
import 'package:eshop/features/cart/data/models/update_item_response.dart';
import 'package:eshop/features/cart/data/services/cart_service.dart';

class CartRepo {
  final CartService _cartService;

  CartRepo(this._cartService);

  Future<ApiResult<AddItemToCartResponse>> addItemToCart({
    required String productId,
    required int quantity,
  }) async {
    try {
      final response = await _cartService.addItemToCart(
        AddItemToCartRequestBody(productId: productId, quantity: quantity),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Add these methods
  Future<ApiResult<GetCartResponse>> getCart() async {
    try {
      final response = await _cartService.getCart();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateItemResponse>> updateCartItem({
    required String itemId,
    required int quantity,
  }) async {
    try {
      // API expects ID in both path and body based on spec, adjust if needed
      final response = await _cartService.updateCartItem(
        itemId,
        UpdateItemRequestBody(id: itemId, quantity: quantity),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteCartItem({required String itemId}) async {
    try {
      // Create the request body
      final requestBody = DeleteItemRequestBody(id: itemId);
      // Pass both itemId for the path and the requestBody
      await _cartService.deleteCartItem(itemId, requestBody);
      return ApiResult.success(null); // Success with no data
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
