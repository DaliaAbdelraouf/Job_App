import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login/views/login_screen_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 190,
              color: const Color(0xffffd6e4ff),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        const Text(
                          "Profile",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          child: IconButton(
                              constraints:
                                  BoxConstraints.tight(const Size(37, 39)),
                              onPressed: () {
                                // _logout();
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 46,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          top: 145,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Colors.white)),
            child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/imagepro.png")),
          ),
        )
      ],
    );
  }
}



  // void _logout() async {
  //   // Clear the login status
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isLoggedIn', false);

  //   // Print the value to ensure it's set to false
  //   var isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   print('isLoggedIn is: $isLoggedIn');

  //   // Navigate to the login screen
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (context) => const LoginScreenView()));
  // }