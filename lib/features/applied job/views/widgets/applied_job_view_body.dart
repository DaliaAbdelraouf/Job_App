import 'package:flutter/material.dart';
import 'package:job_app/features/applied%20job/views/widgets/active_jobs.dart';
import 'package:job_app/features/applied%20job/views/widgets/norejected_job.dart';

import '../../../create account/views/widgets/switch_buttons_widget.dart';

class AppliedJobViewBody extends StatefulWidget {
  const AppliedJobViewBody({super.key});

  @override
  State<AppliedJobViewBody> createState() => _AppliedJobViewBodyState();
}

class _AppliedJobViewBodyState extends State<AppliedJobViewBody> {
  int activePageIndex = 0;

  void switchPage(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //    builder: (context) => ApplyJobView(job: ApplyJobView.createDefaultJob()),
              //   ),
              // );
            },
          ),
          title: Row(children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Applied Job',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ])),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              ColorSwitchButton(
                buttonText: "Active",
                activeColor: const Color(0xfffff091a7a),
                inactiveColor: const Color(0xffffff4f4f5),
                onPressed: () {
                  switchPage(0);
                },
                isActive: activePageIndex == 0,
              ),
              ColorSwitchButton(
                buttonText: "Rejected",
                activeColor: const Color(0xfffff091a7a),
                inactiveColor: const Color(0xffffff4f4f5),
                onPressed: () {
                  switchPage(1);
                },
                isActive: activePageIndex == 1,
              ),
            ]),
          ),
          if (activePageIndex == 0) const ActiveJobs() else const RejectedJob()
        ],
      ),
    );
  }
}
