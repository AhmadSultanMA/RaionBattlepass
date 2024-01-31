import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  UserToken data;

  LoginResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserToken {
  @JsonKey(name: 'token')
  String token;

  UserToken({
    required this.token,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
