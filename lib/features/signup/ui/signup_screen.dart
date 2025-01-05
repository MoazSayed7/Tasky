import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/image_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/signup_cubit.dart';
import 'widgets/did_not_have_any_account_text.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: Image.asset(
                  ImageAssets.signUpImage,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.5.w,
                  right: 24.5.w,
                  top: 188.h,
                ),
                child: Column(
                  spacing: 24.h,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign up',
                        style: TextStyles.font24MidnightGrayBoldDMSans,
                      ),
                    ),
                    SignUpForm(),
                    AppTextButton(
                      buttonText: 'Sign up',
                      onPressed: () async =>
                          await validateThenDoSignup(context),
                      textStyle: TextStyles.font16WhiteBoldDMSans,
                      verticalPadding: 15,
                    ),
                    AlreadyHaveAnyAccountText(),
                    SignupBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateThenDoSignup(BuildContext context) async {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      await context.read<SignupCubit>().emitSignupStates();
    }
  }
}
