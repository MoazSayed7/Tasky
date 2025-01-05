import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/svg_assets.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_bar.dart';
import '../../home/data/models/tasks_response_model.dart';
import '../../home/ui/widgets/tasks_bloc_builder.dart';

class TaskScreen extends StatelessWidget {
  final TasksData tasksModel;
  const TaskScreen({super.key, required this.tasksModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Task Details',
                trailing: GestureDetector(
                  onTapDown: (details) async {
                    final position = details.globalPosition & Size.zero;
                    await showPullDownMenu(
                      context: context,
                      items: [
                        PullDownMenuItem(
                          onTap: () => context.pushReplacementNamed(
                            Routes.editTaskScreen,
                            arguments: tasksModel,
                          ),
                          title: 'Edit',
                          icon: CupertinoIcons.pencil,
                        ),
                        PullDownMenuItem(
                          onTap: () async {
                            // delete task
                            final dio = DioFactory.getDio();
                            final response = await dio.delete(
                              '${ApiConstants.apiBaseUrl}todos/${tasksModel.taskID}',
                            );
                            if (response.statusCode == 200) {
                              if (!context.mounted) return;
                              if (response.data.runtimeType != String) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Task deleted successfully!',
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: const Duration(seconds: 3),
                                    backgroundColor:
                                        ColorsManager.darkSlateGray,
                                  ),
                                );
                                TasksBlocBuilder
                                    .refreshIndicatorKey.currentState
                                    ?.show();
                                if (!context.mounted) return;
                                context.pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      response.data,
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: const Duration(seconds: 3),
                                    backgroundColor:
                                        ColorsManager.darkSlateGray,
                                  ),
                                );
                              }
                            }
                          },
                          title: 'Delete',
                          isDestructive: true,
                          icon: CupertinoIcons.delete,
                        ),
                      ],
                      position: position,
                    );
                  },
                  child: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              _buildHeroImage(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tasksModel.taskTitle!,
                      style: TextStyles.font24MidnightGrayBoldDMSans,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(8),
                    Text(
                      tasksModel.taskDescription!,
                      style: TextStyles.font14MidnightGray60RegularDMSans,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorsManager.lavenderBlush,
                      ),
                      height: 55.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          right: 10.w, left: 24.w, top: 5.h, bottom: 5.h),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Date',
                                style:
                                    TextStyles.font14LavenderGrayRegularDMSans,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '20 May, 2025',
                                style: TextStyles
                                    .font14MidnightGrayRegularDMSans
                                    .copyWith(fontSize: 16.sp),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: SvgPicture.asset(
                              SvgAssets.calendarIcon,
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                    verticalSpace(8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorsManager.lavenderBlush,
                      ),
                      height: 55.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          right: 10.w, left: 24.w, top: 5.h, bottom: 5.h),
                      child: Row(
                        children: [
                          Text(
                            tasksModel.taskStatus!.toTitleCase,
                            style: TextStyles.font16RoyalPurpleBoldDMSans,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorsManager.lavenderBlush,
                      ),
                      height: 55.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          right: 10.w, left: 24.w, top: 5.h, bottom: 5.h),
                      child: Row(
                        children: [
                          Row(
                            spacing: 10.w,
                            children: [
                              Icon(
                                CupertinoIcons.flag,
                                color: ColorsManager.royalPurple,
                                size: 24.sp,
                              ),
                              Text(
                                '${tasksModel.taskPriority!.toTitleCase} Priority',
                                style: TextStyles.font16RoyalPurpleBoldDMSans,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    Container(
                      margin: EdgeInsets.only(left: 3.0.w),
                      child: QrImageView(
                        data: tasksModel.taskID!,
                        version: QrVersions.auto,
                        size: 326.0.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Hero _buildHeroImage() {
    return Hero(
      tag: tasksModel.taskID!,
      child: CachedNetworkImage(
        imageUrl: '${ApiConstants.apiBaseUrl}images/${tasksModel.imagePath!}',
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Shimmer.fromColors(
            baseColor: Color(0xFFE0E0E0), // Light gray
            highlightColor: Color(0xFFF5F5F5), // Very light gray
            child: SizedBox(
              height: 225.h,
              width: double.infinity,
            ),
          );
        },
        imageBuilder: (context, imageProvider) => Container(
          height: 225.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
