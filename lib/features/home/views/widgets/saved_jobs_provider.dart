import 'package:flutter/material.dart';

import '../../../../models/job_model.dart';

class SavedJobsProvider extends ChangeNotifier {
  // List<JobModel> savedJobs = [];

  final List<JobModel> _savedJobs = [];

  List<JobModel> get savedJobs => _savedJobs;
  void addToSavedJobs(JobModel job) {
    savedJobs.add(job);
    notifyListeners();
  }

  void removeFromSavedJobs(JobModel job) {
    savedJobs.remove(job);
    notifyListeners();
  }
}
