import 'package:json_annotation/json_annotation.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SigninResponse {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  SigninResponse({this.id, this.accessToken, this.refreshToken});

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);
}
