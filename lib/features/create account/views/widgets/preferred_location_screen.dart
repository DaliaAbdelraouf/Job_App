import 'package:flutter/material.dart';
import 'package:job_app/features/create%20account/views/widgets/preferred_location_custom_widget.dart';
import 'package:job_app/features/create%20account/views/widgets/switch_buttons_widget.dart';

import 'all_done_screen.dart';

class PreferredLocationScreen extends StatefulWidget {
  const PreferredLocationScreen({super.key});
  static const String id = 'PreferredLocationScreen';
  @override
  State<PreferredLocationScreen> createState() =>
      _PreferredLocationScreenState();
}

class _PreferredLocationScreenState extends State<PreferredLocationScreen> {
  bool isWorkFromOfficeActive = true;

  void switchColors() {
    setState(() {
      isWorkFromOfficeActive = !isWorkFromOfficeActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 70, right: 10),
          child: Column(
            children: [
              const Text("Where are you preferred Location?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let us know, where is the work location you want at this time, so we can adjust it.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                maxLines: 3,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30, right: 16, top: 15),
                child: Container(
                  width: 340,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffffff4f4f5),
                    borderRadius:
                        BorderRadius.circular(40), // Set the border radius
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ColorSwitchButton(
                        buttonText: "Work From Office",
                        activeColor: const Color(0xfffff091a7a),
                        inactiveColor: const Color(0xffffff4f4f5),
                        onPressed: switchColors,
                        isActive: isWorkFromOfficeActive,
                      ),
                      ColorSwitchButton(
                        buttonText: "Remote Work",
                        activeColor: const Color(0xfffff091a7a),
                        inactiveColor: const Color(0xffffff4f4f5),
                        onPressed: switchColors,
                        isActive: !isWorkFromOfficeActive,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: Text(
                  "Select the country you want for your job",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/US.png',
                          title: 'United States'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Malaysia.png',
                          title: 'Malaysia'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Singapore.png',
                          title: 'Singapore'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Indonesia.png',
                          title: 'Indonesia'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Philiphines.png',
                          title: 'Philiphines'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Polandia.png',
                          title: 'Polandia'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/India.png', title: 'India'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Vietnam.png',
                          title: 'Vietnam'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/China.png', title: 'China'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Canada.png',
                          title: 'Canada'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/SaudiArabia.png',
                          title: 'SaudiArabia'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Argentina.png',
                          title: 'Argentina'),
                      SizedBox(width: 10),
                      PreferredLocationCustomWidget(
                          imagePath: 'assets/images/Brazil.png',
                          title: 'Brazil'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllDoneScreen(),
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
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
