import 'package:json_annotation/json_annotation.dart';

part 'signin_request_body.g.dart';

@JsonSerializable()
class SigninRequestBody {
  final String phone;
  final String password;

  SigninRequestBody({required this.phone, required this.password});

  Map<String, dynamic> toJson() => _$SigninRequestBodyToJson(this);
}
