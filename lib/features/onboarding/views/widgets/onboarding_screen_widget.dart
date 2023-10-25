import 'package:flutter/material.dart';

import '../../../create account/views/create_account_view.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({
    Key? key,
    this.text1,
    this.subtitle,
    this.image,
    this.button,
    required this.currentPage,
    required this.index,
    required this.splashData,
    required this.pageController,
    this.text2,
    this.text3,
  }) : super(key: key);
  final String? text1, text2, text3, image, subtitle, button;
  final int currentPage;
  final int index;
  final List<Map<String, String>> splashData; //to access it in the row
  final PageController pageController;

  Widget buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 7 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xffffff3366ff)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity, // Set width to full screen width
          child: Image.asset(
            image!,
            fit: BoxFit.fitWidth, // to make image fits the width
          ),
        ),
        const Spacer(flex: 1),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 27, right: 1),
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: text1 ?? '',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourFontFamily',
                  ),
                ),
                TextSpan(
                  text: text2 ?? '',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourFontFamily',
                  ),
                ),
                TextSpan(
                  text: text3 ?? '',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourFontFamily',
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(flex: 1),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 24),
          child: Text(
            subtitle!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'YourFontFamily',
            ),
          ),
        ),
        const Spacer(flex: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < splashData.length; i++) buildDot(index: i),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            if (currentPage < splashData.length - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Navigate to the next screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountView(),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: const Color(0xffffff3366ff),
            fixedSize: const Size(340, 48),
          ),
          child: Text(
            button!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
