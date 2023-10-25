import 'package:flutter/material.dart';
import 'package:job_app/features/create%20account/views/widgets/preferred_location_screen.dart';

import '../../../home/views/widgets/home_view_body.dart';
import '../../../login/views/login_screen_view.dart';

class AllDoneScreen extends StatelessWidget {
  const AllDoneScreen({super.key});
  static const String id = 'AllDoneScreen';

  @override
  Widget build(BuildContext context) {
    double circleSize = MediaQuery.of(context).size.width * 1.5;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          color: Colors.black, // Change this color to your desired color
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PreferredLocationScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 170),
        child: OverflowBox(
          minWidth: 0.0,
          maxWidth: double.infinity,
          minHeight: 0.0,
          maxHeight: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 230, left: 100),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 15, opacity: 0.6),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 18, opacity: 0.6),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 200, top: 150),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 24, opacity: 0.6),
              ),
              Circle(
                  color: const Color(0xfffffd6e4ff),
                  size: circleSize * 0.3,
                  opacity: 0.4),
              Circle(
                  color: const Color(0xfffffd6e4ff),
                  size: circleSize * 0.2,
                  opacity: 0.8),
              Image.asset(
                "assets/images/user.png",
                width: 80,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(children: const [
                  Text("Your account has been set up!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We have customized feeds according to your preferences",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    // maxLines: 2,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreenView.id);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: const Color(0xffffff3366ff),
                    fixedSize: const Size(340, 48),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;
  const Circle(
      {super.key,
      required this.color,
      required this.size,
      required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity), // Apply opacity to the color
        shape: BoxShape.circle,
      ),
    );
  }
}
