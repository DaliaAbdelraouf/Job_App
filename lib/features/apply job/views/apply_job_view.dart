import 'package:flutter/material.dart';
import 'package:job_app/features/apply%20job/views/widgets/apply_job_view_body.dart';

import '../../../models/job_model.dart';

class ApplyJobView extends StatelessWidget {
  const ApplyJobView({super.key, required this.job});
  final JobModel job;

  static JobModel createDefaultJob() {
    return JobModel(
      id: 0, // Provide a default value for id.
      name: '',
      comp_name: '',
      job_time_type: '',
      job_type: '',
      salary: '', about_comp: '', comp_email: '', comp_website: '',
      job_description: '', job_skill: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ApplyJobDetails(
          job: job,
        ),
      ),
    );
  }
}
