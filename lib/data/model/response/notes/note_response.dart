import 'package:json_annotation/json_annotation.dart';

part 'note_response.g.dart';

@JsonSerializable()
class NoteResponse {
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'data')
  List<NoteData> data;

  NoteResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.count,
    required this.data,
  });

  factory NoteResponse.fromJson(Map<String, dynamic> json) =>
      _$NoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoteResponseToJson(this);
}

@JsonSerializable()
class NoteData {
  @JsonKey(name: 'noteId')
  String noteId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'createdAt')
  String createdAt;

  @JsonKey(name: 'updatedAt')
  String updatedAt;

  NoteData({
    required this.noteId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteData.fromJson(Map<String, dynamic> json) =>
      _$NoteDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDataToJson(this);
}
