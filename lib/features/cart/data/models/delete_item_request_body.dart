import 'package:json_annotation/json_annotation.dart';

part 'delete_item_request_body.g.dart';

@JsonSerializable()
class DeleteItemRequestBody {
  // Assuming the API wants the ID in the body as well, based on the spec structure
  final String id;

  DeleteItemRequestBody({required this.id});

  Map<String, dynamic> toJson() => _$DeleteItemRequestBodyToJson(this);
}
