// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserRequest _$EditUserRequestFromJson(Map<String, dynamic> json) =>
    EditUserRequest(
      name: json['name'] as String?,
      password: json['password'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EditUserRequestToJson(EditUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'description': instance.description,
    };
