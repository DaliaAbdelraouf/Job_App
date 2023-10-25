import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_app/models/job_model.dart';

class SavedJobItem extends StatelessWidget {
  final JobModel savedJob;

  const SavedJobItem({super.key, required this.savedJob});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 20),
              child: SizedBox(
                width: 50,
                height: 50,
                child: CachedNetworkImage(
                  imageUrl: savedJob.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  savedJob.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  savedJob.comp_name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25, right: 60),
                  child: Text(
                    "Posted 2 days ago",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 70, right: 10),
                child: Text(
                  "Be an early applicant",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 35),
          child: SizedBox(
            width: 355,
            child: Divider(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        )
      ],
    );
  }
}
