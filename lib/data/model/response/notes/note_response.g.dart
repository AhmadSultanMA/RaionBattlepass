// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteResponse _$NoteResponseFromJson(Map<String, dynamic> json) => NoteResponse(
      error: json['error'] as bool,
      status: json['status'] as String,
      message: json['message'] as String,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => NoteData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoteResponseToJson(NoteResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'count': instance.count,
      'data': instance.data,
    };

NoteData _$NoteDataFromJson(Map<String, dynamic> json) => NoteData(
      noteId: json['noteId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$NoteDataToJson(NoteData instance) => <String, dynamic>{
      'noteId': instance.noteId,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
