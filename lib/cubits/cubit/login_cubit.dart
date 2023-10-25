import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/api_model.dart';
part 'login_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  void login(String email, String password) async {
    emit(LoginLoading());

    final dio = Dio();

    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];

        // Save the token to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('auth_token', token);
        //save email
        await SharedPreferencesUtil().saveEmail(email);

        final savedToken = prefs.getString('auth_token');
        print('Saved Token: $savedToken');

        emit(LoginSuccess());
      } else if (response.statusCode == 401) {
        final data = response.data;
        final errorMessage = data['message'];
        emit(LoginFailure(errorMessage ?? 'Wrong password, please try again.'));
      } else {
        final data = response.data;
        final errorMessage = data['message'];
        emit(LoginFailure(errorMessage ?? 'Wrong password, please try again.'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}


 // if (response.statusCode == 200) {
      //   final data = response.data;
      //   final token = data['token'];

      // // Save the token to SharedPreferences
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('auth_token', token);
      // // emit(LoginSuccess(token: token));
      //   // log(data['token']);
      //   // print(data['token']);

      //   emit(LoginSuccess());
      ///
      // if (response.statusCode == 200) {
      //   final data = response.data;
      //   final token = data['token'];

      //   // Save the token to SharedPreferences
      //   final prefs = await SharedPreferences.getInstance();
      //   prefs.setString('auth_token', token);
      //   final savedToken = prefs.getString('auth_token');
      //   //
      //   print('Saved Token: $savedToken');

      //   // Check if 'name' key exists in the response data
      //   if (data.containsKey('name')) {
      //     final String name = data['name'];
      //     // You can use the 'name' variable as needed.
      //   } else {
      //     print("error ocuured");
      //   }

      //   emit(LoginSuccess());
      // }