// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_to_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddItemToCartResponse _$AddItemToCartResponseFromJson(
  Map<String, dynamic> json,
) => AddItemToCartResponse(
  message: json['message'] as String?,
  itemId: json['id'] as String?,
  productId: json['productId'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$AddItemToCartResponseToJson(
  AddItemToCartResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'id': instance.itemId,
  'productId': instance.productId,
  'quantity': instance.quantity,
};
