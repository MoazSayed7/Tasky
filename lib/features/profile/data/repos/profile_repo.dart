import 'package:logger/logger.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/profile_api_service.dart';
import '../models/profile_response_model.dart';

class ProfileRepo {
  final ProfileApiService _profileApiService;

  ProfileRepo(this._profileApiService);

  Future<ApiResult<ProfileResponseModel>> getProfileDetails() async {
    try {
      final response = await _profileApiService.getProfileDetails();
      return ApiResult.success(response);
    } catch (error) {
      Logger().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
