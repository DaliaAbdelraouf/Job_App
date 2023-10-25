import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../apply job/views/widgets/apply_job_done.dart';
import '../create_new_password_screen_view.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});
  static const String id = 'CheckEmailScreen';

  // void openAnotherApp() async {
  //   const String customScheme = 'googlegmail:';
  //   const String deepLink =
  //       'googlegmail:///co?to=email@example.com&subject=Subject%20Here&body=Message%20Here';

  //   // Convert customScheme to Uri object
  //   final Uri customSchemeUri = Uri.parse(customScheme);

  //   // Check if the Gmail app is installed
  //   if (await canLaunchUrl(customSchemeUri)) {
  //     // Launch Gmail with the custom scheme
  //     await launchUrl(customSchemeUri);
  //   } else {
  //     // If Gmail is not installed, attempt to open the deep link in a browser
  //     await launchUrl(Uri.parse(deepLink));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double circleSize = MediaQuery.of(context).size.width * 1.5;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
                "assets/images/directbox-receive.png",
                width: 80,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(children: const [
                  Text("Welcome Back",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The Email you entered are correct",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    // maxLines: 2,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 800),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const  CreateNewPasswordScreenView(),
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
                    "Change Password Here",
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

// class Circle extends StatelessWidget {
//   final Color color;
//   final double size;
//   final double opacity;
//   const Circle(
//       {super.key,
//       required this.color,
//       required this.size,
//       required this.opacity});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: color.withOpacity(opacity), // Apply opacity to the color
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }
