import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../data/models/tasks_response_model.dart';
import '../../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  List<TasksData?> tasksList = [];

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getTasks() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getTasks(1);
    try {
      response.when(
        success: (tasksDataList) {
          tasksList = tasksDataList ?? [];
          emit(HomeState.tasksSuccess(tasksList));
        },
        failure: (error) {
          emit(HomeState.tasksError(ErrorHandler.handle(error)));
        },
      );
    } catch (error) {
      Logger().e('ErrorCatch: $error');
      emit(HomeState.tasksError(ErrorHandler.handle(error)));
    }
  }
}
