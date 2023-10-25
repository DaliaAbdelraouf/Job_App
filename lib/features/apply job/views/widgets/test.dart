// class ApplyJobUploadPortfolio extends StatefulWidget {
//   const ApplyJobUploadPortfolio(
//       {super.key,
//       required this.name,
//       required this.email,
//       required this.phone,
//       required this.selectedWorkType,
//       required this.jobId});

//   final String name;
//   final String email;
//   final String phone;
//   final String selectedWorkType; // Store the selected work type
//   final int jobId;

//   @override
//   State<ApplyJobUploadPortfolio> createState() =>
//       _ApplyJobUploadPortfolioState();
// }

// class _ApplyJobUploadPortfolioState extends State<ApplyJobUploadPortfolio> {
//   String? cvFileName;
//   String? cvFileSize;
//   String? cvFileFormat;
//   String? otherFileName;
//   String? otherFileSize;
//   String? otherFileFormat;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 70,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Apply Job',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontFamily: AppFonts.kLoginHeadlineFont,
//           ),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const ApplyingProcess(
//                   stepCompletionStatus: [true, true, false],
//                   currentStep: 3,
//                   totalSteps: 3,
//                 ),
//                 const SizedBox(height: 25),
//                 const ApplyFormHeadline(
//                     headline: 'Upload portfolio',
//                     subheadline: 'Fill in your bio data correctly'),
//                 UploadCvView(
//                   onTap: () => pickCvFile(),
//                   fileName: cvFileName,
//                   fileSize: cvFileSize,
//                   removeFile: removeCvFile,
//                 ),
//                 const SizedBox(height: 20),
//                 UploadOtherFilesView(
//                   onTap: () => pickOtherFile(),
//                   fileName: otherFileName,
//                   fileSize: otherFileSize,
//                 ),
//                 CustomButton(
//                   onPressed: () {
//                     JobApiService.applyJob(
//                       cvFile: cvFile,
//                       email: widget.email,
//                       name: widget.name,
//                       otherFile: otherFile,
//                       phone: widget.phone,
//                       selectedWorkType: widget.selectedWorkType,
//                       jobId: widget.jobId,
//                     );
//                     Provider.of<ApplicationState>(context, listen: false)
//                         .setDataSubmitted(true);

//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return CustomSuccessProcesses(
//                           title: 'Your data has been successfully sent',
//                           subtitle:
//                               'You will get a message from our team, about the announcement of employee acceptance',
//                           image: AppImages.kDataIlustration,
//                           buttonText: 'Back to home',
//                           onPressed: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return HomeView();
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     ));
//                   },
//                   text: 'Submit',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   File? otherFile;
//   File? cvFile;
//   void removeCvFile() {
//     setState(() {
//       cvFileName = null;
//       cvFileSize = null;
//       cvFile = null;
//     });
//   }

//   Future pickCvFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       cvFile = File(result.files.single.path ?? "");
//       setState(() {
//         cvFileName = cvFile?.path.split('/').last; // Extract the filename
//         cvFileSize =
//             '${(cvFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
//       });
//     }
//   }

//   Future pickOtherFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       otherFile = File(result.files.single.path ?? "");
//       setState(() {
//         otherFileName = otherFile?.path.split('/').last; // Extract the filename
//         otherFileSize =
//             '${(otherFile?.lengthSync() ?? 0) / 1024} KB'; // Calculate the file size in KB
//       });
//     }
//   }
// }



// // // import 'package:flutter/material.dart';

// // // class ApplyJobBiodata extends StatelessWidget {
// // //   const ApplyJobBiodata({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       children: [
// // //         Container(
// // //           width: 375,
// // //           height: 812,
// // //           clipBehavior: Clip.antiAlias,
// // //           decoration: ShapeDecoration(
// // //             color: Colors.white,
// // //             shape: RoundedRectangleBorder(
// // //               borderRadius: BorderRadius.circular(20),
// // //             ),
// // //           ),
// // //           child: Stack(
// // //             children: [
// // //               Positioned(
// // //                 left: 0,
// // //                 top: 0,
// // //                 child: SizedBox(
// // //                   width: 375,
// // //                   height: 44,
// // //                   child: Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // //                     children: [
// // //                       Container(
// // //                         width: 375,
// // //                         height: 44,
// // //                         clipBehavior: Clip.antiAlias,
// // //                         decoration: const BoxDecoration(),
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             const SizedBox(width: 375, height: 44),
// // //                             Container(
// // //                               padding: const EdgeInsets.only(top: 2),
// // //                               child: Row(
// // //                                 mainAxisSize: MainAxisSize.min,
// // //                                 mainAxisAlignment: MainAxisAlignment.center,
// // //                                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                                 children: const [
// // //                                   SizedBox(
// // //                                     width: 54,
// // //                                     child: Text(
// // //                                       '9:41',
// // //                                       textAlign: TextAlign.center,
// // //                                       style: TextStyle(
// // //                                         color: Color(0xFF111827),
// // //                                         fontSize: 14,
// // //                                         fontFamily: 'SF Pro Display',
// // //                                         fontWeight: FontWeight.w500,
// // //                                         height: 0.10,
// // //                                         letterSpacing: 0.30,
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             Container(
// // //                               width: 15.27,
// // //                               height: 10.97,
// // //                               decoration: const BoxDecoration(
// // //                                 image: DecorationImage(
// // //                                   image: NetworkImage("https://via.placeholder.com/15x11"),
// // //                                   fit: BoxFit.fill,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             SizedBox(
// // //                               width: 24.33,
// // //                               height: 11.33,
// // //                               child: Stack(
// // //                                 children: [
// // //                                   Positioned(
// // //                                     left: 0,
// // //                                     top: 0,
// // //                                     child: Opacity(
// // //                                       opacity: 0.35,
// // //                                       child: Container(
// // //                                         width: 22,
// // //                                         height: 11.33,
// // //                                         decoration: ShapeDecoration(
// // //                                           shape: RoundedRectangleBorder(
// // //                                             side: const BorderSide(width: 1, color: Color(0xFF111827)),
// // //                                             borderRadius: BorderRadius.circular(2.67),
// // //                                           ),
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   Positioned(
// // //                                     left: 2,
// // //                                     top: 2,
// // //                                     child: Container(
// // //                                       width: 18,
// // //                                       height: 7.33,
// // //                                       decoration: ShapeDecoration(
// // //                                         color: const Color(0xFF111827),
// // //                                         shape: RoundedRectangleBorder(
// // //                                           borderRadius: BorderRadius.circular(1.33),
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             Container(
// // //                               width: 17,
// // //                               height: 10.67,
// // //                               decoration: const BoxDecoration(
// // //                                 image: DecorationImage(
// // //                                   image: NetworkImage("https://via.placeholder.com/17x11"),
// // //                                   fit: BoxFit.fill,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 0,
// // //                 top: 781,
// // //                 child: Container(
// // //                   width: 375,
// // //                   height: 31,
// // //                   padding: const EdgeInsets.only(
// // //                     top: 18,
// // //                     left: 121,
// // //                     right: 120,
// // //                     bottom: 8,
// // //                   ),
// // //                   clipBehavior: Clip.antiAlias,
// // //                   decoration: const BoxDecoration(),
// // //                   child: Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // //                     children: [
// // //                       Container(
// // //                         width: 134,
// // //                         height: 5,
// // //                         decoration: ShapeDecoration(
// // //                           color: const Color(0xFF1F2937),
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(100),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 24,
// // //                 top: 60,
// // //                 child: SizedBox(
// // //                   width: 327,
// // //                   child: Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // //                     children: [
// // //                       SizedBox(
// // //                         width: 24,
// // //                         height: 24,
// // //                         child: Row(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // //                           children: [
// // //                             SizedBox(
// // //                               width: 24,
// // //                               height: 24,
// // //                               child: Stack(children: [
// // //                               ,
// // //                               ]),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 92),
// // //                       const Text(
// // //                         'Apply Job',
// // //                         textAlign: TextAlign.center,
// // //                         style: TextStyle(
// // //                           color: Color(0xFF111827),
// // //                           fontSize: 20,
// // //                           fontFamily: 'SF Pro Display',
// // //                           fontWeight: FontWeight.w500,
// // //                           height: 0.06,
// // //                           letterSpacing: 0.20,
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 92),
// // //                       Opacity(
// // //                         opacity: 0,
// // //                         child: SizedBox(
// // //                           width: 24,
// // //                           height: 24,
// // //                           child: Row(
// // //                             mainAxisSize: MainAxisSize.min,
// // //                             mainAxisAlignment: MainAxisAlignment.center,
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               SizedBox(
// // //                                 width: 24,
// // //                                 height: 24,
// // //                                 child: Stack(children: const [
                                
// // //                                 ]),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 24,
// // //                 top: 724,
// // //                 child: Container(
// // //                   width: 327,
// // //                   height: 48,
// // //                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
// // //                   decoration: ShapeDecoration(
// // //                     color: const Color(0xFF3366FF),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(1000),
// // //                     ),
// // //                   ),
// // //                   child: Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // //                     children: const [
// // //                       Text(
// // //                         'Next',
// // //                         textAlign: TextAlign.center,
// // //                         style: TextStyle(
// // //                           color: Colors.white,
// // //                           fontSize: 16,
// // //                           fontFamily: 'SF Pro Display',
// // //                           fontWeight: FontWeight.w500,
// // //                           height: 0.08,
// // //                           letterSpacing: 0.16,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 23,
// // //                 top: 118,
// // //                 child: Container(
// // //                   child: Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.start,
// // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // //                     children: [
// // //                       Container(
// // //                         width: 91,
// // //                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // //                           children: [
// // //                             SizedBox(
// // //                               width: 44,
// // //                               height: 44,
// // //                               child: Row(
// // //                                 mainAxisSize: MainAxisSize.min,
// // //                                 mainAxisAlignment: MainAxisAlignment.center,
// // //                                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                                 children: [
// // //                                   SizedBox(
// // //                                     width: 44,
// // //                                     height: 44,
// // //                                     child: Stack(children: [
// // //                                     ,
// // //                                     ]),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 8),
// // //                             const SizedBox(
// // //                               width: double.infinity,
// // //                               child: Text(
// // //                                 'Biodata',
// // //                                 textAlign: TextAlign.center,
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF3366FF),
// // //                                   fontSize: 12,
// // //                                   fontFamily: 'SF Pro Display',
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 0.12,
// // //                                   letterSpacing: 0.12,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 2),
// // //                       Transform(
// // //                         transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
// // //                         child: Container(
// // //                           width: 24,
// // //                           decoration: const ShapeDecoration(
// // //                             shape: RoundedRectangleBorder(
// // //                               side: BorderSide(
// // //                                 width: 1,
// // //                                 strokeAlign: BorderSide.strokeAlignCenter,
// // //                                 color: Color(0xFFD1D5DB),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 2),
// // //                       Container(
// // //                         width: 91,
// // //                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // //                           children: [
// // //                             SizedBox(
// // //                               width: 44,
// // //                               height: 44,
// // //                               child: Stack(
// // //                                 children: [
// // //                                   Positioned(
// // //                                     left: 0,
// // //                                     top: 0,
// // //                                     child: Container(
// // //                                       width: 44,
// // //                                       height: 44,
// // //                                       decoration: const ShapeDecoration(
// // //                                         shape: OvalBorder(
// // //                                           side: BorderSide(width: 1, color: Color(0xFF9CA3AF)),
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   const Positioned(
// // //                                     left: 12,
// // //                                     top: 12,
// // //                                     child: SizedBox(
// // //                                       width: 20,
// // //                                       height: 20,
// // //                                       child: Text(
// // //                                         '2',
// // //                                         textAlign: TextAlign.center,
// // //                                         style: TextStyle(
// // //                                           color: Color(0xFF9CA3AF),
// // //                                           fontSize: 16,
// // //                                           fontFamily: 'SF Pro Display',
// // //                                           fontWeight: FontWeight.w500,
// // //                                           height: 0.08,
// // //                                           letterSpacing: 0.16,
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 8),
// // //                             const SizedBox(
// // //                               width: double.infinity,
// // //                               child: Text(
// // //                                 'Type of work',
// // //                                 textAlign: TextAlign.center,
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF111827),
// // //                                   fontSize: 12,
// // //                                   fontFamily: 'SF Pro Display',
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 0.12,
// // //                                   letterSpacing: 0.12,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 2),
// // //                       Transform(
// // //                         transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
// // //                         child: Container(
// // //                           width: 24,
// // //                           decoration: const ShapeDecoration(
// // //                             shape: RoundedRectangleBorder(
// // //                               side: BorderSide(
// // //                                 width: 1,
// // //                                 strokeAlign: BorderSide.strokeAlignCenter,
// // //                                 color: Color(0xFFD1D5DB),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 2),
// // //                       Container(
// // //                         width: 91,
// // //                         padding: const EdgeInsets.symmetric(horizontal: 4),
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // //                           children: [
// // //                             SizedBox(
// // //                               width: 44,
// // //                               height: 44,
// // //                               child: Stack(
// // //                                 children: [
// // //                                   Positioned(
// // //                                     left: 0,
// // //                                     top: 0,
// // //                                     child: Container(
// // //                                       width: 44,
// // //                                       height: 44,
// // //                                       decoration: const ShapeDecoration(
// // //                                         shape: OvalBorder(
// // //                                           side: BorderSide(width: 1, color: Color(0xFF9CA3AF)),
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   const Positioned(
// // //                                     left: 12,
// // //                                     top: 12,
// // //                                     child: SizedBox(
// // //                                       width: 20,
// // //                                       height: 20,
// // //                                       child: Text(
// // //                                         '3',
// // //                                         textAlign: TextAlign.center,
// // //                                         style: TextStyle(
// // //                                           color: Color(0xFF9CA3AF),
// // //                                           fontSize: 16,
// // //                                           fontFamily: 'SF Pro Display',
// // //                                           fontWeight: FontWeight.w500,
// // //                                           height: 0.08,
// // //                                           letterSpacing: 0.16,
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 8),
// // //                             const SizedBox(
// // //                               width: double.infinity,
// // //                               child: Text(
// // //                                 'Upload portfolio',
// // //                                 textAlign: TextAlign.center,
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF111827),
// // //                                   fontSize: 12,
// // //                                   fontFamily: 'SF Pro Display',
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 0.12,
// // //                                   letterSpacing: 0.12,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 left: 24,
// // //                 top: 220,
// // //                 child: SizedBox(
// // //                   height: 371,
// // //                   child: Column(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     mainAxisAlignment: MainAxisAlignment.start,
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       SizedBox(
// // //                         width: double.infinity,
// // //                         height: 48,
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: const [
// // //                             SizedBox(
// // //                               width: double.infinity,
// // //                               child: Text(
// // //                                 'Biodata',
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF111827),
// // //                                   fontSize: 20,
// // //                                   fontFamily: 'SF Pro Display',
// // //                                   fontWeight: FontWeight.w500,
// // //                                   height: 0.06,
// // //                                   letterSpacing: 0.20,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             SizedBox(height: 4),
// // //                             SizedBox(
// // //                               width: double.infinity,
// // //                               child: Text(
// // //                                 'Fill in your bio data correctly',
// // //                                 style: TextStyle(
// // //                                   color: Color(0xFF6B7280),
// // //                                   fontSize: 14,
// // //                                   fontFamily: 'SF Pro Display',
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 0.10,
// // //                                   letterSpacing: 0.14,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 28),
// // //                       SizedBox(
// // //                         width: double.infinity,
// // //                         height: 295,
// // //                         child: Column(
// // //                           mainAxisSize: MainAxisSize.min,
// // //                           mainAxisAlignment: MainAxisAlignment.start,
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             SizedBox(
// // //                               width: double.infinity,
// // //                               height: 85,
// // //                               child: Column(
// // //                                 mainAxisSize: MainAxisSize.min,
// // //                                 mainAxisAlignment: MainAxisAlignment.start,
// // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                                 children: [
// // //                                   const SizedBox(
// // //                                     width: double.infinity,
// // //                                     child: Text.rich(
// // //                                       TextSpan(
// // //                                         children: [
// // //                                           TextSpan(
// // //                                             text: 'Full Name',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFF111827),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                           TextSpan(
// // //                                             text: '*',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFFFF472B),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                         ],
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   const SizedBox(height: 8),
// // //                                   Container(
// // //                                     width: double.infinity,
// // //                                     height: 56,
// // //                                     padding: const EdgeInsets.symmetric(horizontal: 16),
// // //                                     decoration: ShapeDecoration(
// // //                                       shape: RoundedRectangleBorder(
// // //                                         side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                     ),
// // //                                     child: Row(
// // //                                       mainAxisSize: MainAxisSize.min,
// // //                                       mainAxisAlignment: MainAxisAlignment.start,
// // //                                       crossAxisAlignment: CrossAxisAlignment.center,
// // //                                       children: [
// // //                                         SizedBox(
// // //                                           width: 20,
// // //                                           height: 20,
// // //                                           child: Row(
// // //                                             mainAxisSize: MainAxisSize.min,
// // //                                             mainAxisAlignment: MainAxisAlignment.center,
// // //                                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                                             children: [
// // //                                               SizedBox(
// // //                                                 width: 20,
// // //                                                 height: 20,
// // //                                                 child: Stack(children: [
// // //                                                 ,
// // //                                                 ]),
// // //                                               ),
// // //                                             ],
// // //                                           ),
// // //                                         ),
// // //                                         const Expanded(
// // //                                           child: SizedBox(
// // //                                             child: Text(
// // //                                               'Rafif Dian Axelingga',
// // //                                               style: TextStyle(
// // //                                                 color: Color(0xFF111827),
// // //                                                 fontSize: 14,
// // //                                                 fontFamily: 'SF Pro Display',
// // //                                                 fontWeight: FontWeight.w500,
// // //                                                 height: 0.10,
// // //                                                 letterSpacing: 0.30,
// // //                                               ),
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 20),
// // //                             SizedBox(
// // //                               width: double.infinity,
// // //                               height: 85,
// // //                               child: Column(
// // //                                 mainAxisSize: MainAxisSize.min,
// // //                                 mainAxisAlignment: MainAxisAlignment.start,
// // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                                 children: [
// // //                                   const SizedBox(
// // //                                     width: double.infinity,
// // //                                     child: Text.rich(
// // //                                       TextSpan(
// // //                                         children: [
// // //                                           TextSpan(
// // //                                             text: 'Email',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFF111827),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                           TextSpan(
// // //                                             text: '*',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFFFF472B),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                         ],
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   const SizedBox(height: 8),
// // //                                   Container(
// // //                                     width: double.infinity,
// // //                                     height: 56,
// // //                                     padding: const EdgeInsets.symmetric(horizontal: 16),
// // //                                     decoration: ShapeDecoration(
// // //                                       shape: RoundedRectangleBorder(
// // //                                         side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                     ),
// // //                                     child: Row(
// // //                                       mainAxisSize: MainAxisSize.min,
// // //                                       mainAxisAlignment: MainAxisAlignment.start,
// // //                                       crossAxisAlignment: CrossAxisAlignment.center,
// // //                                       children: [
// // //                                         SizedBox(
// // //                                           width: 20,
// // //                                           height: 20,
// // //                                           child: Row(
// // //                                             mainAxisSize: MainAxisSize.min,
// // //                                             mainAxisAlignment: MainAxisAlignment.center,
// // //                                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                                             children: [
// // //                                               SizedBox(
// // //                                                 width: 20,
// // //                                                 height: 20,
// // //                                                 child: Stack(children: [
// // //                                                 ,
// // //                                                 ]),
// // //                                               ),
// // //                                             ],
// // //                                           ),
// // //                                         ),
// // //                                         const Expanded(
// // //                                           child: SizedBox(
// // //                                             child: Text(
// // //                                               'rafifdian12@gmail.com',
// // //                                               style: TextStyle(
// // //                                                 color: Color(0xFF111827),
// // //                                                 fontSize: 14,
// // //                                                 fontFamily: 'SF Pro Display',
// // //                                                 fontWeight: FontWeight.w500,
// // //                                                 height: 0.10,
// // //                                                 letterSpacing: 0.30,
// // //                                               ),
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                             const SizedBox(height: 20),
// // //                             SizedBox(
// // //                               width: double.infinity,
// // //                               height: 85,
// // //                               child: Column(
// // //                                 mainAxisSize: MainAxisSize.min,
// // //                                 mainAxisAlignment: MainAxisAlignment.start,
// // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                                 children: [
// // //                                   const SizedBox(
// // //                                     width: double.infinity,
// // //                                     child: Text.rich(
// // //                                       TextSpan(
// // //                                         children: [
// // //                                           TextSpan(
// // //                                             text: 'No.Handphone',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFF111827),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                           TextSpan(
// // //                                             text: '*',
// // //                                             style: TextStyle(
// // //                                               color: Color(0xFFFF472B),
// // //                                               fontSize: 16,
// // //                                               fontFamily: 'SF Pro Display',
// // //                                               fontWeight: FontWeight.w400,
// // //                                               height: 0.08,
// // //                                               letterSpacing: 0.16,
// // //                                             ),
// // //                                           ),
// // //                                         ],
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                   const SizedBox(height: 8),
// // //                                   Container(
// // //                                     width: 327,
// // //                                     height: 56,
// // //                                     decoration: ShapeDecoration(
// // //                                       shape: RoundedRectangleBorder(
// // //                                         side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
// // //                                         borderRadius: BorderRadius.circular(8),
// // //                                       ),
// // //                                     ),
// // //                                     child: Stack(
// // //                                       children: [
// // //                                         const Positioned(
// // //                                           left: 96,
// // //                                           top: 18,
// // //                                           child: SizedBox(
// // //                                             width: 215,
// // //                                             child: Text(
// // //                                               '0100-666-7234',
// // //                                               style: TextStyle(
// // //                                                 color: Color(0xFF111827),
// // //                                                 fontSize: 14,
// // //                                                 fontFamily: 'SF Pro Display',
// // //                                                 fontWeight: FontWeight.w500,
// // //                                                 height: 0.10,
// // //                                                 letterSpacing: 0.30,
// // //                                               ),
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                         Positioned(
// // //                                           left: 47.97,
// // //                                           top: 20,
// // //                                           child: SizedBox(
// // //                                             width: 15.66,
// // //                                             height: 16,
// // //                                             child: Column(
// // //                                               mainAxisSize: MainAxisSize.min,
// // //                                               mainAxisAlignment: MainAxisAlignment.center,
// // //                                               crossAxisAlignment: CrossAxisAlignment.center,
// // //                                               children: [
// // //                                                 SizedBox(
// // //                                                   width: 15.66,
// // //                                                   height: 16,
// // //                                                   child: Stack(children: [
// // //                                                   ,
// // //                                                   ]),
// // //                                                 ),
// // //                                               ],
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                         Positioned(
// // //                                           left: 16,
// // //                                           top: 19,
// // //                                           child: Container(
// // //                                             width: 24,
// // //                                             height: 18,
// // //                                             clipBehavior: Clip.antiAlias,
// // //                                             decoration: ShapeDecoration(
// // //                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
// // //                                             ),
// // //                                             child: Stack(
// // //                                               children: [
// // //                                                 Positioned(
// // //                                                   left: 0,
// // //                                                   top: 0,
// // //                                                   child: SizedBox(
// // //                                                     width: 24,
// // //                                                     height: 18,
// // //                                                     child: Stack(
// // //                                                       children: [
// // //                                                         Positioned(
// // //                                                           left: 0,
// // //                                                           top: 0,
// // //                                                           child: SizedBox(
// // //                                                             width: 24,
// // //                                                             height: 18,
// // //                                                             child: Stack(
// // //                                                               children: [
// // //                                                                 Positioned(
// // //                                                                   left: 0,
// // //                                                                   top: 0,
// // //                                                                   child: Container(
// // //                                                                     width: 24,
// // //                                                                     height: 18,
// // //                                                                     decoration: const BoxDecoration(color: Colors.black),
// // //                                                                   ),
// // //                                                                 ),
// // //                                                                 Positioned(
// // //                                                                   left: 0,
// // //                                                                   top: 0,
// // //                                                                   child: SizedBox(
// // //                                                                     width: 24,
// // //                                                                     height: 18,
// // //                                                                     child: Stack(
// // //                                                                       children: [
// // //                                                                         Positioned(
// // //                                                                           left: 0,
// // //                                                                           top: 0,
// // //                                                                           child: Container(
// // //                                                                             width: 15,
// // //                                                                             height: 9.75,
// // //                                                                             decoration: const BoxDecoration(color: Color(0xFF2E42A4)),
// // //                                                                           ),
// // //                                                                         ),
// // //                                                                         Positioned(
// // //                                                                           left: 0.45,
// // //                                                                           top: 0.92,
// // //                                                                           child: Container(
// // //                                                                             width: 13.63,
// // //                                                                             height: 7.66,
// // //                                                                             decoration: const BoxDecoration(
// // //                                                                               image: DecorationImage(
// // //                                                                                 image: NetworkImage("https://via.placeholder.com/14x8"),
// // //                                                                                 fit: BoxFit.fill,
// // //                                                                               ),
// // //                                                                             ),
// // //                                                                           ),
// // //                                                                         ),
// // //                                                                       ],
// // //                                                                     ),
// // //                                                                   ),
// // //                                                                 ),
// // //                                                               ],
// // //                                                             ),
// // //                                                           ),
// // //                                                         ),
// // //                                                       ],
// // //                                                     ),
// // //                                                   ),
// // //                                                 ),
// // //                                                 const Positioned(
// // //                                                   left: 0,
// // //                                                   top: 0,
// // //                                                   child: SizedBox(width: 32, height: 24),
// // //                                                 ),
// // //                                               ],
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                         Positioned(
// // //                                           left: 80,
// // //                                           top: 16,
// // //                                           child: Transform(
// // //                                             transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
// // //                                             child: Container(
// // //                                               width: 24,
// // //                                               decoration: const ShapeDecoration(
// // //                                                 shape: RoundedRectangleBorder(
// // //                                                   side: BorderSide(
// // //                                                     width: 1,
// // //                                                     strokeAlign: BorderSide.strokeAlignCenter,
// // //                                                     color: Color(0xFFE5E7EB),
// // //                                                   ),
// // //                                                 ),
// // //                                               ),
// // //                                             ),
// // //                                           ),
// // //                                         ),
// // //                                       ],
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }

// // ///
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // void main() {
// //   runApp(MaterialApp(
// //     home: FirstScreen(),
// //   ));
// // }

// // class FirstScreen extends StatelessWidget {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Enter your details'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(20),
// //         child: Column(
// //           children: <Widget>[
// //             TextField(
// //               controller: nameController,
// //               decoration: InputDecoration(hintText: 'Enter your name'),
// //             ),
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(hintText: 'Enter your email'),
// //             ),
// //             TextField(
// //               controller: phoneController,
// //               decoration: InputDecoration(hintText: 'Enter your phone number'),
// //             ),
// //           ElevatedButton(
// //               child: Text('Next'),
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(nameController.text, emailController.text, phoneController.text)));
// //               },
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SecondScreen extends StatelessWidget {
// //   final String name;
// //   final String email;
// //   final String phone;
// //   final List<String> jobTypes = ['UI', 'UX', 'Android Developer', 'Flutter Developer'];
// //   String selectedJobType;

// //   SecondScreen(this.name, this.email, this.phone, {super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Select job type'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           DropdownButton<String>(
// //             items: jobTypes.map((String value) {
// //               return DropdownMenuItem<String>(
// //                 value: value,
// //                 child: Text(value),
// //               );
// //             }).toList(),
// //             onChanged: (String value) {
// //               selectedJobType = value;
// //             },
// //           ),
// //          ElevatedButton(
// //             child: Text('Next'),
// //             onPressed: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen(name, email, phone, selectedJobType)));
// //             },
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ThirdScreen extends StatelessWidget {
// //   final String name;
// //   final String email;
// //   final String phone;
// //   final String jobType;
// //   final String cvFile = 'path_to_cv_file';
// //   final String otherFile = 'path_to_other_file';
// //   final String userId = 'user_id';
// //   final String jobId = 'jobs_id';

// //   ThirdScreen(this.name, this.email, this.phone, this.jobType);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Upload your CV'),
// //       ),
// //       body: RaisedButton(
// //         child: Text('Submit'),
// //         onPressed: () async {
// //           var response = await http.post('API_ENDPOINT', body: {
// //             'name': name,
// //             'email': email,
// //             'phone': phone,
// //             'work_type': jobType,
// //             'cv_file': cvFile,
// //             'other_file': otherFile,
// //             'user_id': userId,
// //             'jobs_id': jobId,
// //           });

// //           if (response.statusCode == 200) {
// //             print('Job application submitted successfully');
// //           } else {
// //             print('Failed to submit job application');
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }