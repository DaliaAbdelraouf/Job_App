import 'package:flutter/material.dart';

import 'package:job_app/features/create%20account/views/widgets/job_preferences_screen.dart';

class JobPreferencesView extends StatelessWidget {
  const JobPreferencesView({super.key});
  static const String id = 'JobPreferencesView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: JobPreferencesBody(),
      ),
    );
  }
}
