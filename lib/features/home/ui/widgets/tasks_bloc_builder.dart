import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../data/models/tasks_response_model.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'tasks_list_view.dart';

class TasksBlocBuilder extends StatelessWidget {
  static final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final String? selectedTasksStatus;
  const TasksBlocBuilder({super.key, this.selectedTasksStatus});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          tasksSuccess: (tasksList) {
            // show waiting tasks only
            return setupSuccess(
                tasksList?.where(
                  (element) {
                    if (selectedTasksStatus == 'Waiting') {
                      return element?.taskStatus == 'waiting';
                    } else if (selectedTasksStatus == 'In progress') {
                      return element?.taskStatus == 'inProgress';
                    } else if (selectedTasksStatus == 'Finished') {
                      return element?.taskStatus == 'finished';
                    } else if (selectedTasksStatus == 'All') {
                      return true;
                    }
                    return true;
                  },
                ).toList(),
                context);
          },
          tasksError: (error) => setupError(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupError() => Text(
        'Cannot load tasks, please check your internet connection or restart the app',
        style: TextStyle(color: ColorsManager.coral, fontSize: 64.sp),
      );

  Widget setupSuccess(List<TasksData?>? tasksList, BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: () async => context.read<HomeCubit>().getTasks(),
        child: tasksList!.isNotEmpty
            ? TasksListView(
                tasksList: tasksList,
              )
            : ListView(
                children: [
                  Text(
                    'No tasks found',
                    style: TextStyle(
                        color: ColorsManager.royalPurple, fontSize: 44.sp),
                  ),
                ],
              ),
      ),
    );
  }
}
