import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  dynamic data;

  BaseResponse({
    required this.error,
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
