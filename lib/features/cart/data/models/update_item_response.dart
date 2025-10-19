import 'package:json_annotation/json_annotation.dart';

part 'update_item_response.g.dart';

@JsonSerializable()
class UpdateItemResponse {
  final String? message;
  final String? id; // Cart Item ID
  final String? productId;
  final int? quantity;

  UpdateItemResponse({this.message, this.id, this.productId, this.quantity});

  factory UpdateItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateItemResponseToJson(this);
}
