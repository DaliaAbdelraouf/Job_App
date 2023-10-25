import 'package:flutter/material.dart';

import 'apply_job_process_first_screen.dart';
import 'apply_job_process_last_screen.dart';
import 'choise_menu.dart';

class ApplyJobProcessSecondScreen extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;

  const ApplyJobProcessSecondScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
  }) : super(key: key);

  @override
  State<ApplyJobProcessSecondScreen> createState() =>
      _ApplyJobProcessSecondScreenState();
}

class _ApplyJobProcessSecondScreenState
    extends State<ApplyJobProcessSecondScreen> {
  String? selectedJobType;

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
                    builder: (context) => const ApplyJobProcessFirstScreen(),
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
          child: Column(children: [
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
                          color:
                              Colors.blue, // Set the background color to blue
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
                          color:
                              Colors.blue, // Set the background color to blue
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
              padding: EdgeInsets.only(right: 230, top: 40),
              child: Text(
                "Type of work",
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
              padding: EdgeInsets.only(right: 175, bottom: 15),
              child: Text(
                "Fill in your bio data correctly",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Column(
              children: <Widget>[
                // DropdownButton<String>(
               
                ChoiceMenu(
                  onChoiceSelected: (choice) {
                    setState(() {
                      selectedJobType = choice;
                    });
                  },
                ),

                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyJobProcessLastScreen(
                          name: widget.name,
                          email: widget.email,
                          mobile: widget.mobile,
                          jobType: selectedJobType ?? '',
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
          ]),
        ));
  }
}
