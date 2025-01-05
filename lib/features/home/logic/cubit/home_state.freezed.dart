// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorHandler errorHandler) tasksError,
    required TResult Function(List<TasksData?>? tasksList) tasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorHandler errorHandler)? tasksError,
    TResult? Function(List<TasksData?>? tasksList)? tasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorHandler errorHandler)? tasksError,
    TResult Function(List<TasksData?>? tasksList)? tasksSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(TasksError value) tasksError,
    required TResult Function(TasksSuccess value) tasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(TasksError value)? tasksError,
    TResult? Function(TasksSuccess value)? tasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(TasksError value)? tasksError,
    TResult Function(TasksSuccess value)? tasksSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorHandler errorHandler) tasksError,
    required TResult Function(List<TasksData?>? tasksList) tasksSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorHandler errorHandler)? tasksError,
    TResult? Function(List<TasksData?>? tasksList)? tasksSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorHandler errorHandler)? tasksError,
    TResult Function(List<TasksData?>? tasksList)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(TasksError value) tasksError,
    required TResult Function(TasksSuccess value) tasksSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(TasksError value)? tasksError,
    TResult? Function(TasksSuccess value)? tasksSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(TasksError value)? tasksError,
    TResult Function(TasksSuccess value)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorHandler errorHandler) tasksError,
    required TResult Function(List<TasksData?>? tasksList) tasksSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorHandler errorHandler)? tasksError,
    TResult? Function(List<TasksData?>? tasksList)? tasksSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorHandler errorHandler)? tasksError,
    TResult Function(List<TasksData?>? tasksList)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(TasksError value) tasksError,
    required TResult Function(TasksSuccess value) tasksSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(TasksError value)? tasksError,
    TResult? Function(TasksSuccess value)? tasksSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(TasksError value)? tasksError,
    TResult Function(TasksSuccess value)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements HomeState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$TasksErrorImplCopyWith<$Res> {
  factory _$$TasksErrorImplCopyWith(
          _$TasksErrorImpl value, $Res Function(_$TasksErrorImpl) then) =
      __$$TasksErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$TasksErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$TasksErrorImpl>
    implements _$$TasksErrorImplCopyWith<$Res> {
  __$$TasksErrorImplCopyWithImpl(
      _$TasksErrorImpl _value, $Res Function(_$TasksErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$TasksErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$TasksErrorImpl implements TasksError {
  const _$TasksErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'HomeState.tasksError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksErrorImplCopyWith<_$TasksErrorImpl> get copyWith =>
      __$$TasksErrorImplCopyWithImpl<_$TasksErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorHandler errorHandler) tasksError,
    required TResult Function(List<TasksData?>? tasksList) tasksSuccess,
  }) {
    return tasksError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorHandler errorHandler)? tasksError,
    TResult? Function(List<TasksData?>? tasksList)? tasksSuccess,
  }) {
    return tasksError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorHandler errorHandler)? tasksError,
    TResult Function(List<TasksData?>? tasksList)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (tasksError != null) {
      return tasksError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(TasksError value) tasksError,
    required TResult Function(TasksSuccess value) tasksSuccess,
  }) {
    return tasksError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(TasksError value)? tasksError,
    TResult? Function(TasksSuccess value)? tasksSuccess,
  }) {
    return tasksError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(TasksError value)? tasksError,
    TResult Function(TasksSuccess value)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (tasksError != null) {
      return tasksError(this);
    }
    return orElse();
  }
}

abstract class TasksError implements HomeState {
  const factory TasksError(final ErrorHandler errorHandler) = _$TasksErrorImpl;

  ErrorHandler get errorHandler;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksErrorImplCopyWith<_$TasksErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksSuccessImplCopyWith<$Res> {
  factory _$$TasksSuccessImplCopyWith(
          _$TasksSuccessImpl value, $Res Function(_$TasksSuccessImpl) then) =
      __$$TasksSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TasksData?>? tasksList});
}

/// @nodoc
class __$$TasksSuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$TasksSuccessImpl>
    implements _$$TasksSuccessImplCopyWith<$Res> {
  __$$TasksSuccessImplCopyWithImpl(
      _$TasksSuccessImpl _value, $Res Function(_$TasksSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasksList = freezed,
  }) {
    return _then(_$TasksSuccessImpl(
      freezed == tasksList
          ? _value._tasksList
          : tasksList // ignore: cast_nullable_to_non_nullable
              as List<TasksData?>?,
    ));
  }
}

/// @nodoc

class _$TasksSuccessImpl implements TasksSuccess {
  const _$TasksSuccessImpl(final List<TasksData?>? tasksList)
      : _tasksList = tasksList;

  final List<TasksData?>? _tasksList;
  @override
  List<TasksData?>? get tasksList {
    final value = _tasksList;
    if (value == null) return null;
    if (_tasksList is EqualUnmodifiableListView) return _tasksList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeState.tasksSuccess(tasksList: $tasksList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._tasksList, _tasksList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasksList));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksSuccessImplCopyWith<_$TasksSuccessImpl> get copyWith =>
      __$$TasksSuccessImplCopyWithImpl<_$TasksSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ErrorHandler errorHandler) tasksError,
    required TResult Function(List<TasksData?>? tasksList) tasksSuccess,
  }) {
    return tasksSuccess(tasksList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ErrorHandler errorHandler)? tasksError,
    TResult? Function(List<TasksData?>? tasksList)? tasksSuccess,
  }) {
    return tasksSuccess?.call(tasksList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ErrorHandler errorHandler)? tasksError,
    TResult Function(List<TasksData?>? tasksList)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (tasksSuccess != null) {
      return tasksSuccess(tasksList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(TasksError value) tasksError,
    required TResult Function(TasksSuccess value) tasksSuccess,
  }) {
    return tasksSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(TasksError value)? tasksError,
    TResult? Function(TasksSuccess value)? tasksSuccess,
  }) {
    return tasksSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(TasksError value)? tasksError,
    TResult Function(TasksSuccess value)? tasksSuccess,
    required TResult orElse(),
  }) {
    if (tasksSuccess != null) {
      return tasksSuccess(this);
    }
    return orElse();
  }
}

abstract class TasksSuccess implements HomeState {
  const factory TasksSuccess(final List<TasksData?>? tasksList) =
      _$TasksSuccessImpl;

  List<TasksData?>? get tasksList;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksSuccessImplCopyWith<_$TasksSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
