import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.signupError({required String error}) = SignupError;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
}
