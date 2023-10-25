import 'package:flutter/material.dart';

import '../../../login/views/login_screen_view.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
                              onPressed: () {},
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
