import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/shared_prefrences.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  // Dio _createDioInstance() {
  //   final dio = Dio();
  //   dio.options.followRedirects = false; // Disable automatic redirection
  //   dio.options.validateStatus = (status) {
  //     return status != null &&
  //         status < 500; // Check for null and perform the comparison
  //   };
  //   return dio;
  // }

  void forgetPassword(String email) async {
    emit(ForgetPasswordLoading());

    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    final dio = Dio();
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    print('Authorization Token: $token');

    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/auth/otp',
        data: {
          'email': email,
        },
        options: Options(
          followRedirects:
              false, // Disable automatic redirection for this request
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        Fluttertoast.showToast(
          msg: 'Your otp Number is: ${data['data']}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
        );

        emit(ForgetPasswordSuccess());
      } else {
        emit(ForgetPasswordFailure('unknown error happened'));
      }
    } catch (e) {
      emit(ForgetPasswordFailure('Error fetching username: $e'));
    }
  }
  //   Future<void> sendEmailWithOTP(email, String otp) async {
  //   final smtpServer = gmail('your.email@gmail.com', 'your_password');
  //   final message = Message()
  //     ..from = Address('your.email@gmail.com', 'Your Name')
  //     ..recipients.add(email)
  //     ..subject = 'Password Reset OTP'
  //     ..text = 'Your OTP is: $otp';

  //   try {
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: ${sendReport.sent}');
  //   } catch (e) {
  //     print('Error sending email: $e');
  //   }
  // }
}
