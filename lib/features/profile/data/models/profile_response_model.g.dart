// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      userName: json['displayName'] as String?,
      phoneNumber: json['username'] as String?,
      level: json['level'] as String?,
      experienceYears: (json['experienceYears'] as num?)?.toInt(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'displayName': instance.userName,
      'username': instance.phoneNumber,
      'level': instance.level,
      'experienceYears': instance.experienceYears,
      'address': instance.address,
    };
