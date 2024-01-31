// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesRequest _$NotesRequestFromJson(Map<String, dynamic> json) => NotesRequest(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$NotesRequestToJson(NotesRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
