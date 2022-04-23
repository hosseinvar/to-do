// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddTodoState {
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
          AddTodoState value, $Res Function(AddTodoState) then) =
      _$AddTodoStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncRequestStatus? requestStatus,
      String? title,
      DateTime? date,
      String? priority});
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res> implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  final AddTodoState _value;
  // ignore: unused_field
  final $Res Function(AddTodoState) _then;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddTodoStateCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$AddTodoStateCopyWith(
          _AddTodoState value, $Res Function(_AddTodoState) then) =
      __$AddTodoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncRequestStatus? requestStatus,
      String? title,
      DateTime? date,
      String? priority});
}

/// @nodoc
class __$AddTodoStateCopyWithImpl<$Res> extends _$AddTodoStateCopyWithImpl<$Res>
    implements _$AddTodoStateCopyWith<$Res> {
  __$AddTodoStateCopyWithImpl(
      _AddTodoState _value, $Res Function(_AddTodoState) _then)
      : super(_value, (v) => _then(v as _AddTodoState));

  @override
  _AddTodoState get _value => super._value as _AddTodoState;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? priority = freezed,
  }) {
    return _then(_AddTodoState(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddTodoState implements _AddTodoState {
  _$_AddTodoState(
      {this.requestStatus = AsyncRequestStatus.Initial,
      this.title = "",
      this.date,
      this.priority = "Low"});

  @override
  @JsonKey()
  final AsyncRequestStatus? requestStatus;
  @override
  @JsonKey()
  final String? title;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final String? priority;

  @override
  String toString() {
    return 'AddTodoState(requestStatus: $requestStatus, title: $title, date: $date, priority: $priority)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTodoState &&
            const DeepCollectionEquality()
                .equals(other.requestStatus, requestStatus) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.priority, priority));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestStatus),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(priority));

  @JsonKey(ignore: true)
  @override
  _$AddTodoStateCopyWith<_AddTodoState> get copyWith =>
      __$AddTodoStateCopyWithImpl<_AddTodoState>(this, _$identity);
}

abstract class _AddTodoState implements AddTodoState {
  factory _AddTodoState(
      {final AsyncRequestStatus? requestStatus,
      final String? title,
      final DateTime? date,
      final String? priority}) = _$_AddTodoState;

  @override
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  String? get priority => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddTodoStateCopyWith<_AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
