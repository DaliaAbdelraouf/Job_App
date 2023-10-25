import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  void register(String name, String email, String password) async {
    emit(RegisterLoading());

    final dio = Dio();

    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        emit(RegisterSuccess());
      } else {
        // emit(RegisterFailure('Registration failed'));
        final errorMessage = _extractErrorMessage(response.data);
        emit(EmailAlreadyTaken(errorMessage));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  // void registerUser(String name, String email, String password) async {
  //   emit(RegisterLoading());
  //   try {
  //     await apiService.registerUser(name, email, password);
  //     emit(RegisterSuccess());
  //   } catch (e) {
  //     emit(RegisterFailure('Registration failed.'));
  //   }
  // }
}

String _extractErrorMessage(Map<String, dynamic> responseData) {
  if (responseData.containsKey('message')) {
    dynamic message = responseData['message'];
    if (message is String) {
      return message;
    } else if (message is Map<String, dynamic> &&
        message.containsKey('email')) {
      dynamic emailError = message['email'];
      if (emailError is List && emailError.isNotEmpty) {
        return emailError[0]; // Return the first error message in the list
      }
    }
  }
  return 'An error occurred'; // Default error message if extraction fails
}
