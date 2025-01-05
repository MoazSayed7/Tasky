import 'package:flutter/material.dart';

import '../../data/models/tasks_response_model.dart';
import 'tasks_list_view_item.dart';

class TasksListView extends StatelessWidget {
  final List<TasksData?>? tasksList;
  const TasksListView({super.key, this.tasksList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasksList?.length,
      itemBuilder: (context, index) {
        return TasksListViewItem(
          tasksModel: tasksList?[index],
        );
      },
    );
  }
}
