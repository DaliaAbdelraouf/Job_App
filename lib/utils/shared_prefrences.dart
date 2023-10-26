import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn =
        prefs.getBool('isLoggedIn') ?? false; // Default to false if not found
    print("3aaaaaaaaaaaaaaaaa$isLoggedIn");
    return isLoggedIn;
  }
}
