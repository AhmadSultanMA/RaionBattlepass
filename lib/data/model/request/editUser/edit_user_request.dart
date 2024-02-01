import 'package:json_annotation/json_annotation.dart';

part 'edit_user_request.g.dart';

@JsonSerializable()
class EditUserRequest {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'description')
  String? description;

  EditUserRequest({
    this.name,
    this.password,
    this.description,
  });

  factory EditUserRequest.fromJson(Map<String, dynamic> json) =>
      _$EditUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditUserRequestToJson(this);
}
