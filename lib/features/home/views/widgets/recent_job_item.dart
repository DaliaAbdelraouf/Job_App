import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/saved_jobs_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/api_model.dart';
import '../../../../models/job_model.dart';

class RecentJobItem extends StatefulWidget {
  const RecentJobItem({super.key, required this.jobs});
  final JobModel jobs;

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  bool isSaved = false;
  Future<void> toggleFavoriteJob(int jobId, bool isFavorite) async {
    SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
    final dio = Dio();
    final token = await prefsUtil.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    print('Authorization Token: $token');

    const apiUrl = 'https://project2.amit-learning.com/api/favorites';

    try {
      if (isFavorite) {
        // Add the job to favorites
        await dio.post(apiUrl, data: {'job_id': jobId});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Added to favorites successfully"),
        ));
      } else {
        // Remove the job from favorites
        // await dio.delete('$apiUrl/$jobId');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Removed from favorites"),
        ));
      }

      // Update shared preferences when the button is tapped
      updateSharedPrefs(jobId, isFavorite);

      // If the job is removed from favorites, set isSaved to false
      if (!isFavorite) {
        setState(() {
          isSaved = false;
        });
      }
    } catch (e) {
      // Handle any errors here
      print('Error toggling favorite: $e');
    }
  }

  Future<bool> checkIfJobIsFavorite(int jobId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJobs = prefs.getStringList('favoriteJobs');

    if (favoriteJobs != null) {
      return favoriteJobs.contains(jobId.toString());
    }
    return false;
  }

  Future<void> updateSharedPrefs(int jobId, bool isFavorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteJobs = prefs.getStringList('favoriteJobs') ?? [];

    if (isFavorite) {
      favoriteJobs.add(jobId.toString());
    } else {
      favoriteJobs.remove(jobId.toString());
    }

    await prefs.setStringList('favoriteJobs', favoriteJobs);
  }

  @override
  void initState() {
    super.initState();
    // Initialize the isSaved state based on whether the job is already marked as a favorite
    initializeFavoriteState();
  }

  Future<void> initializeFavoriteState() async {
    final isFavorite = await checkIfJobIsFavorite(widget.jobs.id);
    setState(() {
      isSaved = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: CachedNetworkImage(
                imageUrl: widget.jobs.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.jobs.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.jobs.comp_name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final savedJobsProvider =
                    Provider.of<SavedJobsProvider>(context, listen: false);
                setState(() {
                  // Toggle the isSaved state when the button is tapped
                  isSaved = !isSaved;
                  if (isSaved) {
                    savedJobsProvider.addToSavedJobs(widget.jobs);
                  } else {
                    savedJobsProvider.removeFromSavedJobs(widget.jobs);
                  }
                });
                await toggleFavoriteJob(widget.jobs.id, isSaved);
                // Update shared preferences when the button is tapped
                updateSharedPrefs(widget.jobs.id, isSaved);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 90, bottom: 120),
                child: isSaved
                    ? Image.asset(
                        "assets/images/archive-minus_filled.png", // Filled button image
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/Property 1=outline.png", // Unfilled button image
                        fit: BoxFit.cover,
                      ),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue.withOpacity(0.15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: Text(
                        widget.jobs.job_time_type,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue.withOpacity(0.15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: Text(
                        widget.jobs.job_type,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.jobs.salary,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                            fontSize: 17,
                          ),
                        ),
                        const TextSpan(
                          text: ' /Month',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Divider(color: Colors.black.withOpacity(0.4)),
              )
             
            ],
          ),
        ),
      ],
    );
  }
}
