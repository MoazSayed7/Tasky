import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/image_assets.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_text_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            verticalSpace(24),
            Text(
              'Task Management &\nTo-Do List',
              style: TextStyles.font24MidnightGrayBoldDMSans,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            Text(
              'This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!',
              style: TextStyles.font14LavenderGrayRegularDMSans,
              textAlign: TextAlign.center,
            ),
            verticalSpace(32.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: AppTextButton(
                buttonText: 'Let’s Start',
                icon: Icon(
                  IconlyBold.arrowRight,
                  color: Colors.white,
                  size: 24.sp,
                ),
                onPressed: () => context.pushNamed(Routes.signInScreen),
                textStyle: TextStyles.font19WhiteBoldDMSans,
                verticalPadding: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
