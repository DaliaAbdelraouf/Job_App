import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/home_view.dart';
import 'package:job_app/features/home/views/widgets/app_navigation_logic.dart';
import 'package:job_app/features/home/views/widgets/saved_job_item.dart';
import 'package:job_app/features/home/views/widgets/saved_jobs_provider.dart';
import 'package:provider/provider.dart'; // Import the provider package

class SavedJobsScreen extends StatefulWidget {
  static const String id = 'SavedJobsScreen';

  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    final savedJobsProvider = Provider.of<SavedJobsProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    int numberOfSavedJobs =
        savedJobsProvider.savedJobs.length; // Get the number of saved jobs
    return Scaffold(
        appBar: AppBar(
            title: const Center(
              child: Text('Saved',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
            ),
            elevation: 0,
            backgroundColor: Colors.white),
        //consumer listens to the provider and rebuilds a part
        // of the widget tree when a change happens in this provider
        body: Consumer<SavedJobsProvider>(
            builder: (context, savedJobsProvider, child) {
          // Get the number of saved jobs from the provider
          int numberOfSavedJobs = savedJobsProvider.savedJobs.length;

          return Column(
            children: [
              Container(
                width: screenWidth,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color(0xfffffe5e7eb),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "$numberOfSavedJobs Job${numberOfSavedJobs != 1 ? 's' : ''} saved",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: savedJobsProvider.savedJobs.length,
                  itemBuilder: (context, index) {
                    final savedJob = savedJobsProvider.savedJobs[index];
                    return SavedJobItem(savedJob: savedJob);
                  },
                ),
              ),
            ],
          );
        }),

        );
  }
}
