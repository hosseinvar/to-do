// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoListState {
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  List<Task>? get taskList => throw _privateConstructorUsedError;
  int? get completedTaskCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncRequestStatus? requestStatus,
      List<Task>? taskList,
      int? completedTaskCount});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? taskList = freezed,
    Object? completedTaskCount = freezed,
  }) {
    return _then(_value.copyWith(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      taskList: taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      completedTaskCount: completedTaskCount == freezed
          ? _value.completedTaskCount
          : completedTaskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TodoListStateCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$TodoListStateCopyWith(
          _TodoListState value, $Res Function(_TodoListState) then) =
      __$TodoListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncRequestStatus? requestStatus,
      List<Task>? taskList,
      int? completedTaskCount});
}

/// @nodoc
class __$TodoListStateCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateCopyWith<$Res> {
  __$TodoListStateCopyWithImpl(
      _TodoListState _value, $Res Function(_TodoListState) _then)
      : super(_value, (v) => _then(v as _TodoListState));

  @override
  _TodoListState get _value => super._value as _TodoListState;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? taskList = freezed,
    Object? completedTaskCount = freezed,
  }) {
    return _then(_TodoListState(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      taskList: taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      completedTaskCount: completedTaskCount == freezed
          ? _value.completedTaskCount
          : completedTaskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TodoListState implements _TodoListState {
  _$_TodoListState(
      {this.requestStatus = AsyncRequestStatus.Initial,
      final List<Task>? taskList = const [],
      this.completedTaskCount = 0})
      : _taskList = taskList;

  @override
  @JsonKey()
  final AsyncRequestStatus? requestStatus;
  final List<Task>? _taskList;
  @override
  @JsonKey()
  List<Task>? get taskList {
    final value = _taskList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int? completedTaskCount;

  @override
  String toString() {
    return 'TodoListState(requestStatus: $requestStatus, taskList: $taskList, completedTaskCount: $completedTaskCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListState &&
            const DeepCollectionEquality()
                .equals(other.requestStatus, requestStatus) &&
            const DeepCollectionEquality().equals(other.taskList, taskList) &&
            const DeepCollectionEquality()
                .equals(other.completedTaskCount, completedTaskCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestStatus),
      const DeepCollectionEquality().hash(taskList),
      const DeepCollectionEquality().hash(completedTaskCount));

  @JsonKey(ignore: true)
  @override
  _$TodoListStateCopyWith<_TodoListState> get copyWith =>
      __$TodoListStateCopyWithImpl<_TodoListState>(this, _$identity);
}

abstract class _TodoListState implements TodoListState {
  factory _TodoListState(
      {final AsyncRequestStatus? requestStatus,
      final List<Task>? taskList,
      final int? completedTaskCount}) = _$_TodoListState;

  @override
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  @override
  List<Task>? get taskList => throw _privateConstructorUsedError;
  @override
  int? get completedTaskCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoListStateCopyWith<_TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}
