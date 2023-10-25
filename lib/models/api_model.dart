import 'package:dio/dio.dart';
import 'package:job_app/models/job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetJopAPI {
  static const String _baseUrl = 'https://project2.amit-learning.com/api';

  static Future<JobModel> fetchJobs() async {
    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    Dio dio = Dio();

    // Set headers
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.get('$_baseUrl/jobs/sugest/5');

      if (response.statusCode == 200) {
        var data = response.data['data'];

        return JobModel.fromJson(data);
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Failed to load album: $e');
    }
  }

  static Future<List<JobModel>> fetchRecentJobs() async {
    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    Dio dio = Dio();

    // Set headers
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.get('$_baseUrl/jobs');

      if (response.statusCode == 200) {
        var data = response.data['data'];
        List<JobModel> jobList = List.from(data)
            .map((jobData) => JobModel.fromJson(jobData))
            .toList();

        return jobList;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Failed to load album: $e');
    }
  }

  static JobModel parseData(Response<dynamic> response) {
    var jobMap = response.data['data'];
    return JobModel.fromJson(jobMap);
  }
}

class SharedPreferencesUtil {
  SharedPreferencesUtil();
//Save user email
  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }
  Future<void> saveID(int ID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_ID', ID);
  }

  static Future<int?> getID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_ID');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

    Future<void> saveJobId(int jobId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('job_id', jobId);
  }

  // Define a method to get the saved jobId
  Future<int?> getJobId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('job_id');
  }

}
