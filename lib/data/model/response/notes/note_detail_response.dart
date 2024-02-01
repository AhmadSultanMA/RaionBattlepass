import 'package:json_annotation/json_annotation.dart';

part 'note_detail_response.g.dart';

@JsonSerializable()
class NoteDetailResponse {
  @JsonKey(name: 'error')
  bool error;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'data')
  NoteDetailData data;

  NoteDetailResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.count,
    required this.data,
  });

  factory NoteDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NoteDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDetailResponseToJson(this);
}

@JsonSerializable()
class NoteDetailData {
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

  NoteDetailData({
    required this.noteId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteDetailData.fromJson(Map<String, dynamic> json) =>
      _$NoteDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDetailDataToJson(this);
}
