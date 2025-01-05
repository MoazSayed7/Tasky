import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  @JsonKey(name: 'displayName')
  String? userName;
  @JsonKey(name: 'username')
  String? phoneNumber;
  String? level;
  int? experienceYears;
  String? address;

  ProfileResponseModel({
    this.userName,
    this.phoneNumber,
    this.level,
    this.experienceYears,
    this.address,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);
}
