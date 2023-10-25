import 'package:flutter/material.dart';

import '../../../../models/job_model.dart';

class JobContentBuilder extends StatelessWidget {
  final String currentContent;
  final JobModel job;

  const JobContentBuilder(
      {super.key, required this.currentContent, required this.job});

  @override
  Widget build(BuildContext context) {
    // Content lists for each content type
    final Map<String, List<Widget>> contentLists = {
      "Description": [
        const Text(
          "Job Description",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          job.job_description ?? '',
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Skill Required",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          job.job_skill ?? '',
        ),
        const SizedBox(
          height: 10,
        )
        // Add more text widgets as needed
      ],
      "Company": [
        const Text(
          "Contact Us",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(182, 128, 128, 128),
                ),
                color: const Color(0xfffffafafa),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      job.comp_email ?? '',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Container(
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xfffffd6e4ff),
                  // width: 1.3,
                ),
                color: const Color(0xfffffafafa),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Website",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      job.comp_website ?? '',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "About Company",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(job.about_comp ?? ''),
        const SizedBox(
          height: 10,
        )
      ],
      "People": [
        Row(
          children: [
            const Text(
              "3 Employees ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 200),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  // fixedSize: const Size(340, 48),
                ),
                child: const Text(
                  "Developers",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ))
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    "assets/images/Azzahra Profile.png",
                    width: 30,
                    height: 30,
                  )),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    " Dimas Adi Saputro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Senior UI/UX Designer at Twitter",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ],
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contentLists[currentContent] ?? [],
    );
  }
}
