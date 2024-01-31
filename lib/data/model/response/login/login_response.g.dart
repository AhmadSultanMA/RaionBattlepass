// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      error: json['error'] as bool,
      status: json['status'] as String,
      message: json['message'] as String,
      data: UserToken.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserToken _$UserTokenFromJson(Map<String, dynamic> json) => UserToken(
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'token': instance.token,
    };
