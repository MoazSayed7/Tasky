import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/repos/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getProfileData() async {
    emit(const ProfileState.loading());
    final response = await _profileRepo.getProfileDetails();
    try {
      response.when(
        success: (profileResponseModel) {
          emit(ProfileState.fetchSuccess(profileResponseModel));
        },
        failure: (error) {
          emit(ProfileState.fetchError(ErrorHandler.handle(error)));
        },
      );
    } catch (error) {
      emit(ProfileState.fetchError(ErrorHandler.handle(error)));
    }
  }
}
