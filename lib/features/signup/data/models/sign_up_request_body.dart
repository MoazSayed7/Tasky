import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String address;
  final String level;

  SignupRequestBody({
    required this.phone,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
