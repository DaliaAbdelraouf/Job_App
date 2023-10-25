import 'package:flutter/material.dart';

import 'notification_custom_widget.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: screenWidth,
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xfffffe5e7eb),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Job notification",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Your Job Search Alert',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Job Application Update',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Job Application Reminders',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Jobs You May Be Interested In',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Job Seeker Updates',
            ),
          ),
          Container(
            width: screenWidth,
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xfffffe5e7eb),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Other notification",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Show Profile',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'All Message',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Jobs You May Be Interested In',
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: NotificationCustomWidget(
              notificationTitle: 'Message Nudges',
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
