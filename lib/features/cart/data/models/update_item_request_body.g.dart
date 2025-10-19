// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateItemRequestBody _$UpdateItemRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateItemRequestBody(
  id: json['id'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$UpdateItemRequestBodyToJson(
  UpdateItemRequestBody instance,
) => <String, dynamic>{'id': instance.id, 'quantity': instance.quantity};
