import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/cubits/portfolio_cubit/cubit/add_cv_portfolio_cubit.dart';
import 'dart:io';
import '../../../../cubits/portfolio_cubit/cubit/add_cv_portfolio_cubit.dart';

class PortfolioViewBody extends StatefulWidget {
  const PortfolioViewBody({super.key});

  @override
  State<PortfolioViewBody> createState() => _PortfolioViewBodyState();
}

class _PortfolioViewBodyState extends State<PortfolioViewBody> {
  // File? cvFile;
  // File? imageFile;
  String? uploadedFileName;
  String errorMessage = '';

  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCvPortfolioCubit(),
      child: BlocConsumer<AddCvPortfolioCubit, AddCvPortfolioState>(
          listener: (context, state) {
        if (state is AddCvPortfolioSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('File added successfully!'),
              ),
            );
            // setState(() {
            //   uploadedFileName = null; // Clear the uploaded file name
            // });
          });
        } else if (state is AddCvPortfolioFailure) {
          errorMessage = state.errorMessage;
          print("upload failure");
        }
      }, builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              // const Text(
              //   "Add portfolio here",
              // ),
              const Padding(
                padding: EdgeInsets.only(right: 0, top: 0, bottom: 10),
                child: Text(
                  "Other File",
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'Add portfolio here',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                    letterSpacing: 0.16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: DottedBorder(
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
                              side:
                                  const BorderSide(color: Color(0xfffff3366ff)),
                            ),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();

                              if (result != null) {
                                File image =
                                    File(result.files.single.path ?? "");

                                uploadedFileName = image.path.split('/').last;

                                log("cvfile2:$image");
                                context
                                    .read<AddCvPortfolioCubit>()
                                    .uploadPortfolioFiles(image);
                              }
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
                          // const SizedBox(
                          //   height: 30,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              if (uploadedFileName != null)
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
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/images/PDF.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 0),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$uploadedFileName',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'CV.pdf',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
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
            ]));
      }),
    );
  }

  // File? cvFile;
  // File? imageFile;

  // Future pickCvFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     cvFile = File(result.files.single.path ?? "");
  //     // setState(() {
  //     //   cvFileName = cvFile?.path.split('/').last; // Extract the filename
  //     //   cvFileSize =
  //     //       '${(cvFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
  //     // });
  //   }
  // }

  // Future pickOtherFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     imageFile = File(result.files.single.path ?? "");
  //     // setState(() {
  //     //   otherFileName = otherFile?.path.split('/').last; // Extract the filename
  //     //   otherFileSize =
  //     //       '${(otherFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
  //     // });
  //   }
  // }
}
