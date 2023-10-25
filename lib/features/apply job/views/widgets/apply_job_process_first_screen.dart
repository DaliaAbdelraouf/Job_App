import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../apply_job_view.dart';
import 'apply_job_process_last_screen.dart';
import 'apply_job_process_second_screen.dart';
import 'apply_job_view_body.dart';

class ApplyJobProcessFirstScreen extends StatefulWidget {
  const ApplyJobProcessFirstScreen({super.key});

  @override
  State<ApplyJobProcessFirstScreen> createState() =>
      _ApplyJobProcessFirstScreenState();
}

class _ApplyJobProcessFirstScreenState
    extends State<ApplyJobProcessFirstScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

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
                 builder: (context) => ApplyJobView(job: ApplyJobView.createDefaultJob()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      const SizedBox(height: 8),
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
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Text(
                            "2",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), 
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
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.5,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Text(
                            "3",
                            style: TextStyle(
                              color: Colors.black,
                            ),
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
              padding: EdgeInsets.only(right: 280, top: 60),
              child: Text(
                "Biodata",
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
              padding: EdgeInsets.only(right: 175),
              child: Text(
                "Fill in your bio data correctly",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 270, bottom: 10),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Full Name',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
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
            SizedBox(
              width: 360, // Adjust the width as needed
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 299, bottom: 10),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Email',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
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
            SizedBox(
              width: 360,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(
                      Icons.email_outlined), // Icon inside the text field
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 240, bottom: 10),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'No.Headphone',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
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
            SizedBox(
              width: 360,
              child: TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                  hintText: 'Please Enter Your Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(
                      Icons.arrow_drop_down), // Icon inside the text field
                ),
              ),
            ),
           
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplyJobProcessSecondScreen(
                      name: nameController.text,
                      email: emailController.text,
                     mobile: mobileController.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                backgroundColor: const Color(0xffffff3366ff),
                fixedSize: const Size(340, 48),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
