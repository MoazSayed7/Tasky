import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? textInputType;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final void Function()? onEditingComplete;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.maxLines,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.textInputType,
    this.autofillHints,
    this.textInputAction,
    this.onEditingComplete,
    this.prefixIcon,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofillHints: autofillHints,
      maxLines: maxLines ?? 1,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      enabled: enabled,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.royalPurple,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lightAshGray,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.lightAshGray,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14NeutralGrayRegularDMSans,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
