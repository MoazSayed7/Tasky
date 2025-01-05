import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          spacing: 15.h,
          children: [
            AppTextFormField(
              controller: context.read<SignupCubit>().nameController,
              hintText: 'Name...',
              validator: (value) {
                String name = (value ?? '').trim();

                context.read<SignupCubit>().nameController.text = name;

                if (name.isNullOrEmpty()) {
                  return 'Please enter a name';
                }
              },
              autofillHints: const [AutofillHints.name],
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              hintStyle: TextStyles.font14LightAshGrayRegularDMSans,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
            ),
            AppTextFormField(
              controller: context.read<SignupCubit>().phoneController,
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: CountryCodePicker(
                  textStyle: TextStyles.font14NeutralGrayBoldDMSans,
                  onChanged: (value) {
                    context.read<SignupCubit>().dialCode = value.dialCode!;
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
                context.read<SignupCubit>().phoneController.text = phone;
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
              controller: context.read<SignupCubit>().experienceController,
              hintText: 'Years of experience...',
              validator: (value) {
                String experience = (value ?? '').trim();

                context.read<SignupCubit>().experienceController.text =
                    experience;

                if (experience.isNullOrEmpty()) {
                  return 'Please enter a number of years of experience';
                }
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              hintStyle: TextStyles.font14LightAshGrayRegularDMSans,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.number,
            ),
            DropdownButtonHideUnderline(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: ColorsManager.lightAshGray,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: DropdownButton<String>(
                  items: ['fresh', 'junior', 'midLevel', 'senior']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyles.font14DarkSlateGrayMediumDMSans,
                            ),
                          ))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        context.read<SignupCubit>().levelValue = value!;
                      })),
                  enableFeedback: true,
                  borderRadius: BorderRadius.circular(20.r),
                  dropdownColor: Colors.white,
                  iconSize: 24.sp,
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                    color: ColorsManager.neutralGray,
                  ),
                  hint: Text(
                    'Choose experience Level',
                    style: TextStyles.font14DarkSlateGrayMediumDMSans,
                  ),
                  value: context.read<SignupCubit>().levelValue,
                ),
              ),
            ),
            AppTextFormField(
              controller: context.read<SignupCubit>().addressController,
              hintText: 'Address...',
              validator: (value) {
                if (value.isNullOrEmpty()) {
                  return 'Please enter an address';
                }
              },
              autofillHints: const [AutofillHints.name],
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              hintStyle: TextStyles.font14LightAshGrayRegularDMSans,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
            ),
            AppTextFormField(
              controller: context.read<SignupCubit>().passwordController,
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
