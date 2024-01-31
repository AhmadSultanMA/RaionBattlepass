import 'package:json_annotation/json_annotation.dart';

part 'notes_request.g.dart';

@JsonSerializable()
class NotesRequest {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  NotesRequest({
    required this.title,
    required this.description,
  });

  factory NotesRequest.fromJson(Map<String, dynamic> json) =>
      _$NotesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NotesRequestToJson(this);
}
