// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteDetailResponse _$NoteDetailResponseFromJson(Map<String, dynamic> json) =>
    NoteDetailResponse(
      error: json['error'] as bool,
      status: json['status'] as String,
      message: json['message'] as String,
      data: NoteDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoteDetailResponseToJson(NoteDetailResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

NoteDetailData _$NoteDetailDataFromJson(Map<String, dynamic> json) =>
    NoteDetailData(
      noteId: json['noteId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$NoteDetailDataToJson(NoteDetailData instance) =>
    <String, dynamic>{
      'noteId': instance.noteId,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
