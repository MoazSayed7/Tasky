import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/models/profile_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.fetchError(ErrorHandler errorHandler) =
      ProfileLoadError;
  const factory ProfileState.fetchSuccess(
      ProfileResponseModel profileResponseModel) = ProfileFetchedSuccessfully;
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
}
