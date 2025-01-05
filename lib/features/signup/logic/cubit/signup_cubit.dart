import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/sign_up_request_body.dart';
import '../../data/repos/sign_up_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  String dialCode = '+20';
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? levelValue;
  final formKey = GlobalKey<FormState>();
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  Future<void> emitSignupStates() async {
    emit(const SignupState.signupLoading());
    if (levelValue == null) {
      emit(const SignupState.signupError(error: 'Please select your level'));

      return;
    }
    final response = await _signupRepo.signup(
      SignupRequestBody(
        displayName: nameController.text,
        experienceYears: int.parse(experienceController.text),
        address: addressController.text,
        level: levelValue!,
        phone: dialCode + phoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (signupResponse) async {
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
