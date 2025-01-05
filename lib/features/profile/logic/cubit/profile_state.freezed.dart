// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorHandler errorHandler) fetchError,
    required TResult Function(ProfileResponseModel profileResponseModel)
        fetchSuccess,
    required TResult Function() initial,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorHandler errorHandler)? fetchError,
    TResult? Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult? Function()? initial,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorHandler errorHandler)? fetchError,
    TResult Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadError value) fetchError,
    required TResult Function(ProfileFetchedSuccessfully value) fetchSuccess,
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadError value)? fetchError,
    TResult? Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadError value)? fetchError,
    TResult Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileLoadErrorImplCopyWith<$Res> {
  factory _$$ProfileLoadErrorImplCopyWith(_$ProfileLoadErrorImpl value,
          $Res Function(_$ProfileLoadErrorImpl) then) =
      __$$ProfileLoadErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$ProfileLoadErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadErrorImpl>
    implements _$$ProfileLoadErrorImplCopyWith<$Res> {
  __$$ProfileLoadErrorImplCopyWithImpl(_$ProfileLoadErrorImpl _value,
      $Res Function(_$ProfileLoadErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$ProfileLoadErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$ProfileLoadErrorImpl implements ProfileLoadError {
  const _$ProfileLoadErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'ProfileState.fetchError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadErrorImplCopyWith<_$ProfileLoadErrorImpl> get copyWith =>
      __$$ProfileLoadErrorImplCopyWithImpl<_$ProfileLoadErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorHandler errorHandler) fetchError,
    required TResult Function(ProfileResponseModel profileResponseModel)
        fetchSuccess,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return fetchError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorHandler errorHandler)? fetchError,
    TResult? Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult? Function()? initial,
    TResult? Function()? loading,
  }) {
    return fetchError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorHandler errorHandler)? fetchError,
    TResult Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadError value) fetchError,
    required TResult Function(ProfileFetchedSuccessfully value) fetchSuccess,
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return fetchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadError value)? fetchError,
    TResult? Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
  }) {
    return fetchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadError value)? fetchError,
    TResult Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (fetchError != null) {
      return fetchError(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadError implements ProfileState {
  const factory ProfileLoadError(final ErrorHandler errorHandler) =
      _$ProfileLoadErrorImpl;

  ErrorHandler get errorHandler;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileLoadErrorImplCopyWith<_$ProfileLoadErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileFetchedSuccessfullyImplCopyWith<$Res> {
  factory _$$ProfileFetchedSuccessfullyImplCopyWith(
          _$ProfileFetchedSuccessfullyImpl value,
          $Res Function(_$ProfileFetchedSuccessfullyImpl) then) =
      __$$ProfileFetchedSuccessfullyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileResponseModel profileResponseModel});
}

/// @nodoc
class __$$ProfileFetchedSuccessfullyImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileFetchedSuccessfullyImpl>
    implements _$$ProfileFetchedSuccessfullyImplCopyWith<$Res> {
  __$$ProfileFetchedSuccessfullyImplCopyWithImpl(
      _$ProfileFetchedSuccessfullyImpl _value,
      $Res Function(_$ProfileFetchedSuccessfullyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileResponseModel = null,
  }) {
    return _then(_$ProfileFetchedSuccessfullyImpl(
      null == profileResponseModel
          ? _value.profileResponseModel
          : profileResponseModel // ignore: cast_nullable_to_non_nullable
              as ProfileResponseModel,
    ));
  }
}

/// @nodoc

class _$ProfileFetchedSuccessfullyImpl implements ProfileFetchedSuccessfully {
  const _$ProfileFetchedSuccessfullyImpl(this.profileResponseModel);

  @override
  final ProfileResponseModel profileResponseModel;

  @override
  String toString() {
    return 'ProfileState.fetchSuccess(profileResponseModel: $profileResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileFetchedSuccessfullyImpl &&
            (identical(other.profileResponseModel, profileResponseModel) ||
                other.profileResponseModel == profileResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileResponseModel);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileFetchedSuccessfullyImplCopyWith<_$ProfileFetchedSuccessfullyImpl>
      get copyWith => __$$ProfileFetchedSuccessfullyImplCopyWithImpl<
          _$ProfileFetchedSuccessfullyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorHandler errorHandler) fetchError,
    required TResult Function(ProfileResponseModel profileResponseModel)
        fetchSuccess,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return fetchSuccess(profileResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorHandler errorHandler)? fetchError,
    TResult? Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult? Function()? initial,
    TResult? Function()? loading,
  }) {
    return fetchSuccess?.call(profileResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorHandler errorHandler)? fetchError,
    TResult Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult Function()? initial,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(profileResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadError value) fetchError,
    required TResult Function(ProfileFetchedSuccessfully value) fetchSuccess,
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return fetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadError value)? fetchError,
    TResult? Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
  }) {
    return fetchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadError value)? fetchError,
    TResult Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileFetchedSuccessfully implements ProfileState {
  const factory ProfileFetchedSuccessfully(
          final ProfileResponseModel profileResponseModel) =
      _$ProfileFetchedSuccessfullyImpl;

  ProfileResponseModel get profileResponseModel;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileFetchedSuccessfullyImplCopyWith<_$ProfileFetchedSuccessfullyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState.initial()';
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
    required TResult Function(ErrorHandler errorHandler) fetchError,
    required TResult Function(ProfileResponseModel profileResponseModel)
        fetchSuccess,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorHandler errorHandler)? fetchError,
    TResult? Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult? Function()? initial,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorHandler errorHandler)? fetchError,
    TResult Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult Function()? initial,
    TResult Function()? loading,
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
    required TResult Function(ProfileLoadError value) fetchError,
    required TResult Function(ProfileFetchedSuccessfully value) fetchSuccess,
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadError value)? fetchError,
    TResult? Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadError value)? fetchError,
    TResult Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
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
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
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
    required TResult Function(ErrorHandler errorHandler) fetchError,
    required TResult Function(ProfileResponseModel profileResponseModel)
        fetchSuccess,
    required TResult Function() initial,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorHandler errorHandler)? fetchError,
    TResult? Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult? Function()? initial,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorHandler errorHandler)? fetchError,
    TResult Function(ProfileResponseModel profileResponseModel)? fetchSuccess,
    TResult Function()? initial,
    TResult Function()? loading,
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
    required TResult Function(ProfileLoadError value) fetchError,
    required TResult Function(ProfileFetchedSuccessfully value) fetchSuccess,
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadError value)? fetchError,
    TResult? Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadError value)? fetchError,
    TResult Function(ProfileFetchedSuccessfully value)? fetchSuccess,
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProfileState {
  const factory Loading() = _$LoadingImpl;
}
