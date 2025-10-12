import 'package:json_annotation/json_annotation.dart';

part 'verify_email_response.g.dart';

@JsonSerializable()
class VerifyEmailResponse {
  final String? message;

  VerifyEmailResponse({this.message});

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);
}
