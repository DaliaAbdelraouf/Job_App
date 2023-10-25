import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/recent_job_item.dart';
import '../../../../models/job_model.dart';
import '../../../apply job/views/widgets/apply_job_view_body.dart';

class RecentJobView extends StatelessWidget {
  const RecentJobView({super.key, required this.jobs});
  final List<JobModel> jobs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true, //builds every children all at once
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              var currentJob = jobs[index];
              // Navigate to the job details screen when a job is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ApplyJobDetails(job: currentJob),
                ),
              );
            },
            child: RecentJobItem(jobs: jobs[index]));
      },
    );
  }
}
