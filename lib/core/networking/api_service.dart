import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/signin/data/models/signin_request_body.dart';
import '../../features/signin/data/models/signin_response.dart';
import '../../features/signup/data/models/sign_up_request_body.dart';
import '../../features/signup/data/models/sign_up_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signin)
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
