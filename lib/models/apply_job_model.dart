import 'dart:io';
class ApplyJopModel {
  final File? cvFilePath;
  final File? otherFilePath; 
  final String name;
  final String email;
  final String mobile;
  final String workType;
  final String jopId;
  final String userId;

  ApplyJopModel({
    this.cvFilePath,
    this.otherFilePath, 
    required this.name,
    required this.email,
    required this.mobile,
    required this.workType,
    required this.jopId,
    required this.userId,
  });

  ApplyJopModel copyWith({
    File? cvFilePath,
    File? otherFilePath, // Change the type to File?
    String? userName,
    String? email,
    String? mobile,
    String? workType,
    String? jopId,
    String? userId,
  }) {
    return ApplyJopModel(
      cvFilePath: cvFilePath ?? this.cvFilePath,
      otherFilePath: otherFilePath ?? this.otherFilePath, // Change the type to File?
      name: userName ?? name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      workType: workType ?? this.workType,
      jopId: jopId ?? this.jopId,
      userId: userId ?? this.userId,
    );
  }

  factory ApplyJopModel.fromJson(jsondata) {
    return ApplyJopModel(
      cvFilePath: File(jsondata["data"]["cv_file"]),
      otherFilePath: File(jsondata["data"]["other_file"]), // Change the type to File?
      name: jsondata["data"]["name"],
      email: jsondata["data"]["email"],
      mobile: jsondata["data"]["mobile"],
      workType: jsondata["data"]["work_type"],
      jopId: jsondata["data"]["jobs_id"],
      userId: jsondata["data"]["user_id"],
    );
  }
}





// class ApplyJopModel {
//   final String cvFilePath;
//   final String userName;
//   final String email;
//   final String mobile;
//   final String workType;
//   final String otherFilePath;
//   final String jopId;
//   final String userId;

//   ApplyJopModel({
//     required this.cvFilePath,
//     required this.userName,
//     required this.email,
//     required this.mobile,
//     required this.workType,
//     required this.otherFilePath,
//     required this.jopId,
//     required this.userId,
//   });

//   factory ApplyJopModel.fromJson(jsondata) {
//     return ApplyJopModel(
//       cvFilePath: jsondata["data"]["cv_file"],
//       userName: jsondata["data"]["name"],
//       email: jsondata["data"]["email"],
//       mobile: jsondata["data"]["mobile"],
//       workType: jsondata["data"]["work_type"],
//       otherFilePath: jsondata["data"]["other_file"],
//       jopId: jsondata["data"]["jobs_id"],
//       userId: jsondata["data"]["user_id"],
//     );
//   }
// }