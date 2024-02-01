import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  UserData data;

  UserResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'salt')
  String salt;

  UserData({
    required this.id,
    required this.name,
    required this.password,
    required this.salt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
