import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState<T> with _$SigninState<T> {
  const factory SigninState.error({required String error}) = Error;

  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = Loading;
  const factory SigninState.success(T data) = Success<T>;
}
