import 'package:flutter/material.dart';
import 'package:job_app/features/applied%20job/views/widgets/applied_job_view_body.dart';

class AppliedJobView extends StatelessWidget {
  const AppliedJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AppliedJobViewBody(),
      ),
    );
  }
}
