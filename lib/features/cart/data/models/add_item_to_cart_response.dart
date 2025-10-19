import 'package:json_annotation/json_annotation.dart';

part 'add_item_to_cart_response.g.dart';

@JsonSerializable()
class AddItemToCartResponse {
  final String? message;
  @JsonKey(name: 'id') // API uses 'id' for the cart item ID in the response
  final String? itemId;
  final String? productId;
  final int? quantity;

  AddItemToCartResponse({
    this.message,
    this.itemId,
    this.productId,
    this.quantity,
  });

  factory AddItemToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddItemToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddItemToCartResponseToJson(this);
}
