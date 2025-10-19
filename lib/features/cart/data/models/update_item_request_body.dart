import 'package:json_annotation/json_annotation.dart';

part 'update_item_request_body.g.dart';

@JsonSerializable()
class UpdateItemRequestBody {
  // Note: The API spec shows 'Id' in the path, but also requires 'id' in the body.
  // We might only need the one in the path, but include it here based on the spec.
  // Adjust if the API behaves differently.
  final String id;
  final int quantity;

  UpdateItemRequestBody({required this.id, required this.quantity});

  Map<String, dynamic> toJson() => _$UpdateItemRequestBodyToJson(this);
}
