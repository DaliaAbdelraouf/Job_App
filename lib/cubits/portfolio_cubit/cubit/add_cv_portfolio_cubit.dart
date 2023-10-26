import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:job_app/utils/shared_prefrences.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'dart:developer' as developer;

import '../../../models/api_model.dart';
part 'add_cv_portfolio_state.dart';

class AddCvPortfolioCubit extends Cubit<AddCvPortfolioState> {
  AddCvPortfolioCubit() : super(AddCvPortfolioLoading());

  void uploadPortfolioFiles(File? image) async {
    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    Dio dio = Dio();

    // Set headers
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    // dio.options.followRedirects = true; // Allow following redirects
    // dio.options.maxRedirects = 5; // Maximum number of redirects to follow
    developer.log("token$token");
    emit(AddCvPortfolioLoading());
    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/user/profile/portofolios',
        data: FormData.fromMap({
          'image': await MultipartFile.fromFile(image!.path),
        }),
        options: Options(
          followRedirects: false, // Prevent automatic redirection
          // validateStatus: (status) => status! < 500, // Validate status code
        ),
      );
      developer.log("token$token");
      developer.log("still notttt");
      print('Response body: ${response.data}');
      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];

        // final savedToken = prefs.getString('auth_token');
        // print('Saved Token: $savedToken');
        // final data = response.data['data'];
        // final cvFile = data['cv_file'] as String;
        // final image = data['image'] as String;

        emit(AddCvPortfolioSuccess());
        developer.log("successsss");
      }
    } catch (e) {
      emit(AddCvPortfolioFailure(e.toString()));
    }
  }
}
