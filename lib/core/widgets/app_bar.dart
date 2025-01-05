import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/extensions.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const CustomAppBar({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        spacing: 8.w,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              IconlyBold.arrowLeft,
            ),
            iconSize: 24.sp,
            color: ColorsManager.deepIndigo,
          ),
          Text(
            title,
            style: TextStyles.font16MidnightGrayBoldDMSans,
          ),
          if (trailing != null) ...[
            Spacer(),
            trailing!,
          ]
        ],
      ),
    );
  }
}
