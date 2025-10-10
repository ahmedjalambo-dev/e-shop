import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? accessToken;
  final String? expiresAtUtc;
  final String? refreshToken;

  LoginResponse({this.accessToken, this.expiresAtUtc, this.refreshToken});
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
