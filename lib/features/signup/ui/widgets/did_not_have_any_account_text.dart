import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/styles.dart';

class AlreadyHaveAnyAccountText extends StatelessWidget {
  const AlreadyHaveAnyAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have any account?',
            style: TextStyles.font14NeutralGrayRegularDMSans,
          ),
          TextSpan(
            text: ' Sign in',
            style: TextStyles.font14RoyalPurpleBoldDMSans.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacementNamed(Routes.signInScreen),
          ),
        ],
      ),
    );
  }
}
