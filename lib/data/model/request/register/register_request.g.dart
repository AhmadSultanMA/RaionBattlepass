// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      nim: json['nim'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'nim': instance.nim,
      'name': instance.name,
      'password': instance.password,
      'description': instance.description,
    };
