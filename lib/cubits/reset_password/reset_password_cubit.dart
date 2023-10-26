import 'package:bloc/bloc.dart';
import 'package:job_app/utils/shared_prefrences.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../models/api_model.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  
    void resetPassword(String password) async {
    emit(ResetPasswordLoading());

    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    final dio = Dio();
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    print('Authorization Token: $token');

    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/auth/user/update',
        data: {
          'password': password,
        },
        options: Options(
          followRedirects:
              false, // Disable automatic redirection for this request
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);

        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailure('unknown error happened'));
      }
    } catch (e) {
      emit(ResetPasswordFailure('Error fetching username: $e'));
    }
  }
}
