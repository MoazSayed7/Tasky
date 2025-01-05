import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/signin_request_body.dart';
import '../../data/repos/signin_repo.dart';
import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  TextEditingController phoneController = TextEditingController();
  String dialCode = '+20';
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final SigninRepo _signinRepo;

  SigninCubit(this._signinRepo) : super(const SigninState.initial());

  Future<void> emitSigninStates() async {
    emit(const SigninState.loading());
    final response = await _signinRepo.signin(
      SigninRequestBody(
        phone: dialCode + phoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.accessToken, loginResponse.accessToken!);
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken, loginResponse.refreshToken!);
      emit(SigninState.success(loginResponse));
    }, failure: (error) {
      emit(SigninState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
