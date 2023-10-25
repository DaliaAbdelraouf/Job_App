part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  // final String name;

  // ForgetPasswordSuccess(this.name);
}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordFailure(this.errorMessage);

}
