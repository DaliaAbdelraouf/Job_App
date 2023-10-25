part of 'login_cubit.dart';

@immutable

abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}


class LoginLoading extends LoginCubitState {}

class LoginSuccess extends LoginCubitState {
  //  final String token;

  // LoginSuccess({required this.token});

  // @override
  // List<Object> get props => [token];
}

class LoginFailure extends LoginCubitState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}