import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/job_model.dart';

part 'search_jobs_state.dart';

class SearchJobsCubit extends Cubit<SearchJobsState> {
  SearchJobsCubit() : super(SearchJobsInitial());

  Future<List<JobModel>> fetchSearchJobs({required String searchWord}) async {
    emit(SearchJobsLoading());

    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    Dio dio = Dio();

    // Set headers
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        'https://project2.amit-learning.com/api/jobs/search',
        data: {
          'name': searchWord,
        },
      );

      if (response.statusCode == 200) {
        var data = response.data['data'];

        // Convert the data list to a list of JobModel objects
        List<JobModel> jobList = List.from(data)
            .map((jobData) => JobModel.fromJson(jobData))
            .toList();
        emit(SearchJobsSuccess(results: jobList));

        return jobList;
      }
    } catch (e) {
      emit(SearchJobsFailure(e.toString()));
    }

    // empty
    return List<JobModel>.empty();
  }
}

class SharedPreferencesUtil {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
