import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/image_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/signin_cubit.dart';
import 'widgets/did_not_have_any_account_text.dart';
import 'widgets/signin_bloc_listener.dart';
import 'widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 482.h,
                child: Image.asset(
                  ImageAssets.onBoardingImage,
                  width: double.infinity,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.5.w),
                child: Column(
                  spacing: 24.h,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: TextStyles.font24MidnightGrayBoldDMSans,
                      ),
                    ),
                    SignInForm(),
                    AppTextButton(
                      buttonText: 'Sign In',
                      onPressed: () async =>
                          await validateThenDoSignin(context),
                      textStyle: TextStyles.font16WhiteBoldDMSans,
                      verticalPadding: 15,
                    ),
                    DidNotHaveAnyAccountText(),
                    const SigninBlocListener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateThenDoSignin(BuildContext context) async {
    if (context.read<SigninCubit>().formKey.currentState!.validate()) {
      await context.read<SigninCubit>().emitSigninStates();
    }
  }
}
