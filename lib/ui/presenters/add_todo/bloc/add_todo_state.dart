import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../base/enums/request_status.dart';

part 'add_todo_state.freezed.dart';

@freezed
class AddTodoState with _$AddTodoState {

  factory AddTodoState({
    @Default(AsyncRequestStatus.Initial) AsyncRequestStatus? requestStatus,
    @Default("") String? title,
    DateTime? date,
    @Default("Low") String? priority,
  }) = _AddTodoState;

}