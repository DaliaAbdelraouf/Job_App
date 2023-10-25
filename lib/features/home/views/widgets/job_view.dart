// import 'package:flutter/material.dart';
// import 'package:job_app/features/home/views/widgets/jobs_item.dart';
// import 'package:job_app/models/job_model.dart';

// class JobView extends StatelessWidget {
//   const JobView({super.key, required this.job});
//   final JobModel job;

//   @override
//   Widget build(BuildContext context) {
//     return JobsItem(job: job);
//   }
// }

import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/jobs_item.dart';
import 'package:job_app/models/job_model.dart';

import '../../../apply job/views/widgets/apply_job_view_body.dart'; // Import the job details screen

class JobView extends StatelessWidget {
  const JobView({Key? key, required this.job}) : super(key: key);
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the job details screen when the job is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ApplyJobDetails(job: job), // Pass the job data
          ),
        );
      },
      child: JobsItem(job: job),
    );
  }
}
