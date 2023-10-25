// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/home/views/home_view.dart';
import 'package:job_app/models/job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../../../models/api_model.dart';
import '../../../../models/apply_job_model.dart';
import 'apply_job_done.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io' as io; // Import 'dart:io' with a prefix

class ApplyJobProcessLastScreen extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final String jobType;

  const ApplyJobProcessLastScreen({
    super.key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.jobType,
  });

  @override
  State<ApplyJobProcessLastScreen> createState() =>
      _ApplyJobProcessLastScreenState();
}

class _ApplyJobProcessLastScreenState extends State<ApplyJobProcessLastScreen> {
  // File? otherFile = File('default_path');
  // File? cvFile = File('default_path');

  int jobId = 4;
  String userId = '';

  final ImagePicker picker = ImagePicker();
  late ApplyJopModel jobModel;

  @override
  void initState() {
    super.initState();

    // Initialize applyModel in the initState method

    // jobModel = ApplyJopModel(
    //   cvFilePath: cvFile,
    //   name: widget.name,
    //   email: widget.email,
    //   mobile: widget.mobile,
    //   workType: widget.jobType,
    //   otherFilePath: otherFile,
    //   jopId: jobId,
    //   userId: userId,
    // );
  }

  static Future submitApplication(
      {required name,
      required email,
      required workType,
      required mobile,
      required File? cvFile,
      required File? otherFile,
      // required cvFile,
      // required otherFile,
      required jobId}) async {
    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    final dio = Dio();
    // Retrieve the authorization token from SharedPreferences
    final token = await prefsUtil.getToken();
    final userId = await SharedPreferencesUtil.getID();

    // Set the authorization header
    dio.options.headers['Authorization'] = 'Bearer $token';
    print("tokkken$token");

    try {
      FormData formData = FormData.fromMap({
        'cv_file':
            cvFile != null ? await MultipartFile.fromFile(cvFile.path) : null,
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': workType,
        'other_file': otherFile != null
            ? await MultipartFile.fromFile(otherFile.path)
            : null,
        'jobs_id': jobId,
        'user_id': userId,
      });

      // Print the FormData to check for null values
      for (var field in formData.fields) {
        print('${field.key}: ${field.value}');
      }
      await prefsUtil.saveJobId(jobId);
      print("jobbbbifddddddddddd$jobId");
      // Send the POST request to the API endpoint
      final response = await dio.post(
        'https://project2.amit-learning.com/api/apply',
        data: formData,
      );

      print('Response body: ${response.data}');
      // Check the status code of the API response
      if ("status" == true) {
        // Successful response
        final data = response.data;
        final token = data['token'];

        // Save the token to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('auth_token', token);
        final savedToken = prefs.getString('auth_token');
        print('Saved Token: $savedToken');

        print('Job application submitted successfully');
      } else {
        // Handle API error response
        var errorData = response.data;
        var errorMessage = errorData['message'];

        // Log the error message
        print('API Error: $errorMessage');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
            ),
            title: Row(children: const [
              Expanded(
                child: Center(
                  child: Text(
                    'Apply Job',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ])),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8), // Adjust the height as needed
                    const Text(
                      "Biodata",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Set the background color to blue
                        border: Border.all(
                          color: Colors.blue, // Set the border color to blue
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8), // Adjust the height as needed
                    const Text(
                      "Type of work",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Set the background color to blue
                        border: Border.all(
                          color: Colors.blue, // Set the border color to blue
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8), // Adjust the height as needed
                    const Text(
                      "Upload Portfolio",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 170, top: 30),
            child: Text(
              "Upload your portfolio",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 175, bottom: 40),
            child: Text(
              "Fill in your bio data correctly",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 270, bottom: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: 'Upload CV',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                  letterSpacing: 0.16,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFFF472B),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 0.08,
                  letterSpacing: 0.16,
                ),
              ),
            ])),
          ),
          Container(
            height: 80,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                pickCvFile();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/images/PDF.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'cv name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'CV.pdf file size ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        "assets/images/edit-2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        "assets/images/close-circle.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 270, top: 30, bottom: 20),
            child: Text(
              "Other File",
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 16,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 0.08,
                letterSpacing: 0.16,
              ),
            ),
          ),
          DottedBorder(
            dashPattern: const [6, 0, 2, 3],
            color: const Color(0xffffffff3366ff),
            borderType: BorderType.RRect,
            borderPadding: const EdgeInsets.all(1),
            radius: const Radius.circular(8),
            child: Container(
              height: 240,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xfffffecf2ff)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfffffd6e4ff),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/document-upload.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Upload Your Files',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Max. file size 10 MB",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: const Color(0xfffffd6e4ff),
                        fixedSize: const Size(330, 48),
                        side: const BorderSide(color: Color(0xfffff3366ff)),
                      ),
                      onPressed: () async {
                        await pickOtherFile();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 85),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.file_upload_outlined,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add File",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: const Color(0xffffff3366ff),
              fixedSize: const Size(340, 48),
            ),
            onPressed: () {
           
              if (cvFile != null && otherFile != null) {
                print('NOT NULLL');
                submitApplication(
                  cvFile: cvFile,
                  name: widget.name,
                  email: widget.email,
                  mobile: widget.mobile,
                  workType: widget.jobType,
                  otherFile: otherFile,
                  jobId: jobId,
                );
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Apply Job Done!'),
                    // duration: Duration(seconds: 3),
                  ),
                );
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ApplyJobDone(),
                ),
              );
            },
            child: const Text(
              "Submit",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ]));
  }

  File? otherFile;
  File? cvFile;

  Future pickCvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      cvFile = File(result.files.single.path ?? "");
      // setState(() {
      //   cvFileName = cvFile?.path.split('/').last; // Extract the filename
      //   cvFileSize =
      //       '${(cvFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
      // });
    }
  }

  Future pickOtherFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      otherFile = File(result.files.single.path ?? "");
      // setState(() {
      //   otherFileName = otherFile?.path.split('/').last; // Extract the filename
      //   otherFileSize =
      //       '${(otherFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
      // });
    }
  }
}
