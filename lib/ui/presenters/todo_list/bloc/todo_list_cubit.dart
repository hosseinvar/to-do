import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/base/enums/request_status.dart';
import 'package:to_do/ui/presenters/todo_list/bloc/todo_list_state.dart';
import 'package:to_do/ui/presenters/todo_list/domain/model/task_model.dart';
import 'package:to_do/ui/presenters/todo_list/domain/repository/task_repository.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit(TodoListState initialState) : super(initialState);

  final taskRepository = TaskRepository();

  void getTaskList() {
    emit(state
        .copyWith(requestStatus: AsyncRequestStatus.Submitting, taskList: []));

    taskRepository.getTaskList().then((value) {
      emit(state.copyWith(
          requestStatus: AsyncRequestStatus.Success,
          taskList: value,
          completedTaskCount:
              value.where((element) => element.status == 1).length));
    }, onError: (e) {
      if (kDebugMode) {
        print(e);
      }

      emit(state.copyWith(requestStatus: AsyncRequestStatus.Error));
    });
  }

  void deleteTask(Task task) {
    taskRepository.deleteTask(task.id!).then((value) {
      if (kDebugMode) {
        print(value);
      }

      var list =
          state.taskList!.where((element) => element.id != task.id).toList();

      emit(state.copyWith(taskList: list));
    }, onError: (e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  void updateTask(Task task) {
    taskRepository.updateTask(task).then((value) {
      if (kDebugMode) {
        print(value);
      }

      int index =
          state.taskList!.indexWhere((element) => element.id == task.id);

      List<Task> list = List.from(state.taskList!)
        ..removeAt(index)
        ..insert(index, task);

      emit(state.copyWith(
          taskList: list,
          completedTaskCount:
              list.where((element) => element.status == 1).length));
    }, onError: (e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}
