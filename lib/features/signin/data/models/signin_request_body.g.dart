// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRequestBody _$SigninRequestBodyFromJson(Map<String, dynamic> json) =>
    SigninRequestBody(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestBodyToJson(SigninRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };
