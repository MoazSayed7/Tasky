import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/signin_cubit.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: context.read<SigninCubit>().formKey,
        child: Column(
          spacing: 20.h,
          children: [
            AppTextFormField(
              controller: context.read<SigninCubit>().phoneController,
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: CountryCodePicker(
                  textStyle:TextStyles.font14NeutralGrayBoldDMSans,
                  onChanged: (value) {
                    context.read<SigninCubit>().dialCode = value.dialCode!;
                  },
                  initialSelection: 'EG',
                  favorite: const ['+20', 'EG'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                ),
              ),
              hintText: '123 456-7890',
              validator: (value) {
                String phone = (value ?? '').trim();

                context.read<SigninCubit>().phoneController.text = phone;

                if (phone.isNullOrEmpty()) {
                  return 'Please enter a phone number';
                }
              },
              autofillHints: const [AutofillHints.telephoneNumber],
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              hintStyle: TextStyles.font14LightAshGrayRegularDMSans,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.phone,
            ),
            AppTextFormField(
              controller: context.read<SigninCubit>().passwordController,
              hintText: 'Password...',
              validator: (value) {
                if (value!.isNullOrEmpty()) {
                  return 'Please enter a password';
                }
              },
              autofillHints: const [AutofillHints.password],
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              hintStyle: TextStyles.font14NeutralGrayRegularDMSans,
              isObscureText: isObscureText,
              textInputAction: TextInputAction.done,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: ColorsManager.lightAshGray,
                  size: 24.sp,
                ),
              ),
              textInputType: TextInputType.visiblePassword,
              onEditingComplete: TextInput.finishAutofillContext,
            ),
          ],
        ),
      ),
    );
  }
}
