import 'package:flutter/material.dart';
import 'package:job_app/features/profile/views/profile_view.dart';
import 'package:job_app/features/profile/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => const ProfileView(),
              ),
            );
          },
        ),
        title: Row(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: NotificationViewBody(),
      ),
    );
  }
}
