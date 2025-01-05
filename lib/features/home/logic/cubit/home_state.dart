import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/models/tasks_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.tasksError(ErrorHandler errorHandler) = TasksError;
  const factory HomeState.tasksSuccess(List<TasksData?>? tasksList) =
      TasksSuccess;
}
