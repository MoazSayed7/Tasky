import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/svg_assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../data/models/profile_response_model.dart';

class ProfileListViewItem extends StatelessWidget {
  final ProfileResponseModel? profileResponseModel;
  const ProfileListViewItem({super.key, this.profileResponseModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        _buildContainer('Name', profileResponseModel!.userName!, context),
        _buildContainer('Phone', profileResponseModel!.phoneNumber!, context),
        _buildContainer('Level', profileResponseModel!.level!, context),
        _buildContainer('Years of experience',
            profileResponseModel!.experienceYears!.toString(), context),
        _buildContainer('Location', profileResponseModel!.address!, context),
      ],
    );
  }

  Widget _buildContainer(String label, String value, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorsManager.whiteSmoke,
      ),
      height: 68.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              Text(
                label.toTitleCase,
                style: TextStyles.font12DarkSlateGray40MediumDMSans,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value.toTitleCase,
                style: TextStyles.font18DarkSlateGray60BoldDMSans,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          if (label == 'Phone') ...[
            const Spacer(),
            GestureDetector(
              child: SvgPicture.asset(
                SvgAssets.copyIcon,
              ),
              onTap: () async =>
                  await Clipboard.setData(ClipboardData(text: value)),
            )
          ]
        ],
      ),
    );
  }
}
