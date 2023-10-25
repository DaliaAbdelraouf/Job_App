import 'package:flutter/material.dart';
import 'package:job_app/features/create%20account/views/widgets/preferred_location_screen.dart';

import 'job_preferences_item.dart';

class JobPreferencesBody extends StatelessWidget {
  const JobPreferencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 40),
      child: Column(children: [
        const Text("What type of work are you interested in?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Tell us what you’re interested in so we can customise the app for your needs.",
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            primary: false,
            padding: const EdgeInsets.only(
              right: 17,
              top: 10,
            ),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
            children: const <Widget>[
              JobPreferenceItem(
                imagePath: 'assets/images/Designer.png',
                title: 'UI/UX Designer',
              ),
              JobPreferenceItem(
                imagePath: 'assets/images/Developer Category.png',
                title: 'Illustrator Designer',
              ),
              JobPreferenceItem(
                imagePath: 'assets/images/Ilustrator Category.png',
                title: 'Developer',
              ),
              JobPreferenceItem(
                imagePath: 'assets/images/Information technology category.png',
                title: 'Management',
              ),
              JobPreferenceItem(
                imagePath: 'assets/images/Management Category.png',
                title: 'Information Technology',
              ),
              JobPreferenceItem(
                imagePath: 'assets/images/Research and Analytics category.png',
                title: 'Research and Analytics',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PreferredLocationScreen(),
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
      ]),
    );
  }
}
