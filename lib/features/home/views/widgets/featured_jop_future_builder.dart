import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/job_view.dart';
import 'package:job_app/models/api_model.dart';

class FeaturedJopFutureBuilder extends StatelessWidget {
  const FeaturedJopFutureBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetJopAPI.fetchJobs(),
      builder: (context, snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.connectionState == ConnectionState.done) {
            return JobView(job: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return Text(
            snapshot.error.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}

 