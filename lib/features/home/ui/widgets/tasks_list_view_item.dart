import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../data/models/tasks_response_model.dart';
import '../../logic/cubit/home_cubit.dart';

class TasksListViewItem extends StatelessWidget {
  final TasksData? tasksModel;
  const TasksListViewItem({super.key, this.tasksModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.taskScreen,
        arguments: tasksModel,
      ),
      child: SizedBox(
        height: 96.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Row(
            spacing: 12.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: tasksModel!.taskID!,
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.apiBaseUrl}images/${tasksModel!.imagePath!}',
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Shimmer.fromColors(
                      baseColor: Color(0xFFE0E0E0), // Light gray
                      highlightColor: Color(0xFFF5F5F5), // Very light gray
                      child: Container(
                        width: 64.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) => Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Status Row
                    Row(
                      spacing: 8.w,
                      children: [
                        Expanded(
                          child: Text(
                            tasksModel!.taskTitle!,
                            style: TextStyles.font16MidnightGrayBoldDMSans,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: tasksModel!.taskStatus == 'waiting'
                                ? ColorsManager.lavenderPink
                                : tasksModel!.taskStatus == 'inProgress'
                                    ? ColorsManager.lavenderBlush
                                    : ColorsManager.lightSkyBlue,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            tasksModel!.taskStatus!.toTitleCase,
                            style: TextStyles.font12RoyalPurpleMediumDMSans
                                .copyWith(
                              color: tasksModel!.taskStatus == 'waiting'
                                  ? ColorsManager.coral
                                  : tasksModel!.taskStatus == 'inProgress'
                                      ? ColorsManager.royalPurple
                                      : ColorsManager.vividBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Description
                    Text(
                      tasksModel!.taskDescription!,
                      style: TextStyles.font14MidnightGray60RegularDMSans,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Priority and Date Row
                    Row(
                      children: [
                        Row(
                          spacing: 4.w,
                          children: [
                            Icon(
                              CupertinoIcons.flag,
                              color: tasksModel!.taskPriority == 'low'
                                  ? ColorsManager.vividBlue
                                  : tasksModel!.taskPriority == 'high'
                                      ? ColorsManager.coral
                                      : ColorsManager.royalPurple,
                              size: 16.sp,
                            ),
                            Text(
                              tasksModel!.taskPriority!.toTitleCase,
                              style: TextStyles.font12RoyalPurpleMediumDMSans
                                  .copyWith(
                                color: tasksModel!.taskPriority == 'low'
                                    ? ColorsManager.vividBlue
                                    : tasksModel!.taskPriority == 'high'
                                        ? ColorsManager.coral
                                        : ColorsManager.royalPurple,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '30/12/2022',
                          style: TextStyles.font14MidnightGray60RegularDMSans,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTapDown: (details) async {
                  final position = details.globalPosition & Size.zero;
                  await showPullDownMenu(
                    context: context,
                    items: [
                      PullDownMenuItem(
                        onTap: () => context.pushNamed(
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
                            '${ApiConstants.apiBaseUrl}todos/${tasksModel!.taskID}',
                          );
                          if (response.statusCode == 200) {
                            if (!context.mounted) return;
                            if (response.data.runtimeType != String) {
                              // refresh tasks list
                              context.read<HomeCubit>().getTasks();
                              // show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Task deleted successfully!',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: ColorsManager.darkSlateGray,
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
            ],
          ),
        ),
      ),
    );
  }
}
