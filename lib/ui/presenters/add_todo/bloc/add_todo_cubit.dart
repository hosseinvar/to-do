import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/enums/request_status.dart';
import '../../todo_list/domain/model/task_model.dart';
import '../repository/AddTodoRepository.dart';
import 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit(AddTodoState initialState) : super(initialState);

  final taskRepository = AddTodoRepository();

  void insertTask(Task? task) {
    emit(state.copyWith(requestStatus: AsyncRequestStatus.Submitting));

    if (task == null) {
      taskRepository
          .insertTask(Task(
              title: state.title,
              date: state.date ?? DateTime.now(),
              priority: state.priority,
              status: 0))
          .then(
        (value) {
          emit(state.copyWith(requestStatus: AsyncRequestStatus.Success));
        },
        onError: (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(state.copyWith(requestStatus: AsyncRequestStatus.Error));
        },
      );
    } else {
      taskRepository
          .updateTask(task.copyWith(
              title: state.title, date: state.date, priority: state.priority))
          .then(
        (value) {
          emit(state.copyWith(requestStatus: AsyncRequestStatus.Success));
        },
        onError: (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(state.copyWith(requestStatus: AsyncRequestStatus.Error));
        },
      );
    }
  }

  void addTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void addDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void addPriority(String priority) {
    emit(state.copyWith(priority: priority));
  }

  void initUpdate(Task? task) {
    if (task != null) {
      emit(state.copyWith(
          title: task.title!, date: task.date!, priority: task.priority));
    }
  }
}
