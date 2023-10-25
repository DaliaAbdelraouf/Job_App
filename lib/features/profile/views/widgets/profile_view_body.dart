import 'package:flutter/material.dart';
import 'package:job_app/features/profile/views/widgets/custom_user_profile_list.dart';
import 'package:job_app/features/profile/views/widgets/user_info_widget.dart';
import 'package:job_app/features/profile/views/widgets/user_profile.dart';

import '../help_center_view.dart';
import '../language_view.dart';
import '../login_security_view.dart';
import '../notification_view.dart';
import '../portfolio_view.dart';
import '../privacy_policy_view.dart';
import '../terms_conditions_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: [
        const UserProfile(),
        const Text(
          "Dalia",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Text(
          " Senior Flutter Developer",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        const UserInfo(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                softWrap: true,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 126, 126, 126)),
              ),
            )
          ],
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
                "General",
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
          child: ProfileOption(
            title: 'Edit profile',
            image: AssetImage("assets/images/frame.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Portfolio',
            image: const AssetImage("assets/images/folder-favorite.png"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PortfolioView()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Language',
            image: const AssetImage(
              "assets/images/global.png",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageView()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Notification',
            image: const AssetImage("assets/images/notification.png"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationView()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Login and security',
            image: const AssetImage("assets/images/lock.png"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginAndSecurityView()),
              );
            },
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
                "Others",
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
          child: ProfileOption(
            title: 'Accessibility',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Help Center',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpCenterView()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Terms & Conditions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsView()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileOption(
            title: 'Privacy Policy',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
              );
            },
          ),
        ),
      ]),
    );
  }
}
