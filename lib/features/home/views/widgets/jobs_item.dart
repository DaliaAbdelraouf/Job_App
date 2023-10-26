import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/saved_jobs_provider.dart';
import 'package:job_app/models/job_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../../../../models/api_model.dart';
import '../../../../utils/shared_prefrences.dart';
import '../../../apply job/views/apply_job_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobsItem extends StatefulWidget {
  const JobsItem({super.key, required this.job});
  final JobModel job;

  @override
  State<JobsItem> createState() => _JobsItemState();
}

class _JobsItemState extends State<JobsItem> {
  bool isSaved = false;

  // Future<void> toggleFavoriteJob(int jobId, bool isFavorite) async {
  //   SharedPreferencesUtil prefsUtil = SharedPreferencesUtil();
  //   final dio = Dio();
  //   final token = await prefsUtil.getToken();
  //   dio.options.headers['Authorization'] = 'Bearer $token';
  //   print('Authorization Token: $token');

  //   const apiUrl = 'https://project2.amit-learning.com/api/favorites';

  //   try {
  //     if (isFavorite) {
  //       // Add the job to favorites
  //       await dio.post(apiUrl, data: {'job_id': jobId});
  //     } else {
  //       // Remove the job from favorites
  //       await dio.delete('$apiUrl/$jobId');
  //     }
  //   } catch (e) {
  //     // Handle any errors here
  //     print('Error toggling favorite: $e');
  //   }
  // }
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
    final isFavorite = await checkIfJobIsFavorite(widget.job.id);
    setState(() {
      isSaved = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xfffff091a7a),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100, left: 20),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetworkImage(
                    imageUrl: widget.job.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.job.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.job.comp_name,
                      style: const TextStyle(
                        color: Colors.grey,
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
                      savedJobsProvider.addToSavedJobs(widget.job);
                    } else {
                      savedJobsProvider.removeFromSavedJobs(widget.job);
                    }
                  });
                  await toggleFavoriteJob(widget.job.id, isSaved);
                  // Update shared preferences when the button is tapped
                  updateSharedPrefs(widget.job.id, isSaved);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, bottom: 120),
                  child: isSaved
                      ? Image.asset(
                          "assets/images/archive-minus_filled.png", // Filled button image
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/archive-minus.png", // Unfilled button image
                          fit: BoxFit.cover,
                        ),
                ),
              )
            ],
          ),
          const SizedBox(height: 19),
          Positioned(
            bottom: 15,
            left: 10,
            right: 0,
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
                            Colors.white.withOpacity(0.15),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        child: Text(
                          widget.job.job_time_type,
                          style: const TextStyle(
                            color: Colors.white,
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
                            Colors.white.withOpacity(0.15),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        child: Text(
                          widget.job.job_type,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.job.salary,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              const TextSpan(
                                text: ' /Month',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 100),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xfffff3366ff)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Apply",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
