import 'package:json_annotation/json_annotation.dart';

part 'add_item_to_cart_request_body.g.dart';

@JsonSerializable()
class AddItemToCartRequestBody {
  final String productId;
  final int quantity;

  AddItemToCartRequestBody({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => _$AddItemToCartRequestBodyToJson(this);
}
