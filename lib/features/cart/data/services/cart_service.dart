import 'package:dio/dio.dart';
import 'package:eshop/core/netowoks/api_constant.dart';
import 'package:eshop/features/cart/data/models/add_item_to_cart_request_body.dart';
import 'package:eshop/features/cart/data/models/add_item_to_cart_response.dart';
import 'package:eshop/features/cart/data/models/delete_item_request_body.dart';
import 'package:eshop/features/cart/data/models/get_cart_response.dart';
import 'package:eshop/features/cart/data/models/update_item_request_body.dart';
import 'package:eshop/features/cart/data/models/update_item_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @POST(ApiConstant.cartItems)
  Future<AddItemToCartResponse> addItemToCart(
    @Body() AddItemToCartRequestBody addItemToCartRequestBody,
  );

  @GET(ApiConstant.cart)
  Future<GetCartResponse> getCart();

  @PUT("${ApiConstant.cartItems}/{id}") // Note the path parameter
  Future<UpdateItemResponse> updateCartItem(
    @Path("id") String itemId,
    @Body() UpdateItemRequestBody updateItemRequestBody,
  );

  @DELETE(
    "${ApiConstant.cartItems}/{Id}",
  ) // Ensure path uses {Id} (uppercase I)
  Future<void> deleteCartItem(
    @Path("Id") String itemId, // Ensure @Path uses "Id" (uppercase I)
    @Body() DeleteItemRequestBody body, // Add the body parameter
  );
}
