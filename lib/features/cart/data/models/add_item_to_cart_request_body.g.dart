// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_to_cart_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddItemToCartRequestBody _$AddItemToCartRequestBodyFromJson(
  Map<String, dynamic> json,
) => AddItemToCartRequestBody(
  productId: json['productId'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$AddItemToCartRequestBodyToJson(
  AddItemToCartRequestBody instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
