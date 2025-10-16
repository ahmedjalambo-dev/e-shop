import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;

  CategoriesResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}
