import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/base/enums/request_status.dart';

import '../domain/model/task_model.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {

  factory TodoListState({
    @Default(AsyncRequestStatus.Initial) AsyncRequestStatus? requestStatus,
    @Default([]) List<Task>? taskList,
    @Default(0) int? completedTaskCount,
  }) = _TodoListState;

}