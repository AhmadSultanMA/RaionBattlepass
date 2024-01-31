import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'nim')
  String nim;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'description')
  String description;

  RegisterRequest({
    required this.nim,
    required this.name,
    required this.password,
    required this.description,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
