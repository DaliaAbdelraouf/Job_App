import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/recent_job_item.dart';

import '../../../../models/job_model.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.jobs});
  final List<JobModel> jobs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true, 
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return RecentJobItem(jobs: jobs[index]);
      },
    );
  }
}
