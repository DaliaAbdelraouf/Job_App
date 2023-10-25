import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/home_view.dart';
import '../../../../models/api_model.dart';
import '../../../../models/job_model.dart';
import 'apply_job_process_first_screen.dart';
import 'apply_job_switch_buttons.dart';
import 'job_content_builder.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyJobDetails extends StatefulWidget {
  const ApplyJobDetails({super.key, required this.job});
  final JobModel job;
  @override
  State<ApplyJobDetails> createState() => _ApplyJobDetailsState();
}

class _ApplyJobDetailsState extends State<ApplyJobDetails> {
  bool isDescriptionActive = true;
  bool isCompanyActive = false;
  bool isPeopleActive = false;
  String currentContent = "Description";

  @override
  void initState() {
    super.initState();
  }

  void switchDescription() {
    setState(() {
      currentContent = "Description";
      isDescriptionActive = true;
      isCompanyActive = false;
      isPeopleActive = false;
    });
  }

  void switchCompany() {
    setState(() {
      currentContent = "Company";
      isDescriptionActive = false;
      isCompanyActive = true;
      isPeopleActive = false;
    });
  }

  void switchPeople() {
    setState(() {
      currentContent = "People";
      isDescriptionActive = false;
      isCompanyActive = false;
      isPeopleActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
          title: Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Job Detail',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/Property 1=outline.png',
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: job.image ?? '',
                width: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                job.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                job.comp_name,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
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
                          job.job_time_type,
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
                          job.job_type,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ApplyJobColorSwitchButton(
                      buttonText: "Description",
                      activeColor: const Color(0xfffff091a7a),
                      inactiveColor: const Color(0xffffff4f4f5),
                      onPressed: switchDescription,
                      isActive: isDescriptionActive,
                    ),
                  ),
                  Expanded(
                    child: ApplyJobColorSwitchButton(
                      buttonText: "Company",
                      activeColor: const Color(0xfffff091a7a),
                      inactiveColor: const Color(0xffffff4f4f5),
                      onPressed: switchCompany,
                      isActive: isCompanyActive,
                    ),
                  ),
                  Expanded(
                    child: ApplyJobColorSwitchButton(
                      buttonText: "People",
                      activeColor: const Color(0xfffff091a7a),
                      inactiveColor: const Color(0xffffff4f4f5),
                      onPressed: switchPeople,
                      isActive: isPeopleActive,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              JobContentBuilder(currentContent: currentContent, job: job,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplyJobProcessFirstScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: const Color(0xffffff3366ff),
                  fixedSize: const Size(340, 48),
                ),
                child: const Text(
                  "Apply Now",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
