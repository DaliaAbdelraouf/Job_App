// import 'package:dio/dio.dart';
// import 'package:job_app/models/api_model.dart';
// import '../features/create account/views/job_preferences_view.dart';

// class ApiService {
//   static const String _baseUrl = 'https://project2.amit-learning.com/api';
  
//   // Callback to handle successful registration
//   final void Function() onRegistrationSuccess;

//   ApiService(this.onRegistrationSuccess);
//   Future<void> registerUser(String name, String email, password) async {
//     const apiUrl = '$_baseUrl/auth/register';

//     try {
//       final dio = Dio();

//       final response = await dio.post(
//         apiUrl,
//         data: {'name': name, 'email': email, 'password': password},
//       );

//       if (response.statusCode == 200) {
//         print("Account created successfully");
//          onRegistrationSuccess();
       
//       } else {
//         print("Failed to create account");
//       }
//     } catch (e) {
//       if (e is DioException) {
//         //?>> ....
//         var errMessage = e.response?.data['error']['error'] ??
//             'something went wrong try later';  // if the value on the left is null get the string to the error message
//         throw Exception(errMessage);
//       }
//       throw Exception("something went wrong ");
//     }
//   }
// }


//  // Handle token retrieval and storage here
