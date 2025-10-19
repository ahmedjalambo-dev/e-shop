// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateItemResponse _$UpdateItemResponseFromJson(Map<String, dynamic> json) =>
    UpdateItemResponse(
      message: json['message'] as String?,
      id: json['id'] as String?,
      productId: json['productId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateItemResponseToJson(UpdateItemResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
