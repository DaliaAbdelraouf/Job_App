import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/recent_job_view.dart';

import '../../../../models/api_model.dart';
import '../../../../models/job_model.dart';
import '../../../apply job/views/widgets/apply_job_view_body.dart';

class FeaturedRecentJobFutureBuilder extends StatelessWidget {
  const FeaturedRecentJobFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetJopAPI.fetchRecentJobs(),
      builder: (context, snapshot) {
        // Check for errors in the snapshot
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
        // Check the connection state
        if (snapshot.connectionState == ConnectionState.done) {
         
          if (snapshot.data != null && snapshot.data is List<JobModel>) {
            return RecentJobView(
              jobs: snapshot.data as List<JobModel>,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
