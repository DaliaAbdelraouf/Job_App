import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';
import '../../../create account/views/create_account_view.dart';
import 'onboarding_screen_widget.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  late PageController pageController;

  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/Background.png",
      "text1": "Find a job, and ",
      "text2": "start building ",
      "text3": "your career from now on",
      "subtitle":
          "Explore over 25,924 available job roles and upgrade your operator now.",
      "button": "Next"
    },
    {
      "image": "assets/images/Background2.png",
      "text1": "Hundreds of jobs are waiting for you to ",
      "text2": "join together ",
      "subtitle":
          "Immediately join us and start applying for the job you are interested in",
      "button": "Next"
    },
    {
      "image": "assets/images/Background3.png",
      "text1": "Get the best ",
      "text2": "choice for the job ",
      "text3": "you've always dreamed of",
      "subtitle":
          "The better the skills you have, the greater the good job opportunities for you.",
      "button": "Get Started"
    },
  ];

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0); //to navigate between the pages
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading:
            false, // Prevents the back button from appearing
        backgroundColor: Colors.white,

        title: Container(
          padding: const EdgeInsets.only(top: 10), // Add top padding
          child: Image.asset(
            AppImages.Klogo,
            width: 80,
            height: 50,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountView(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex:
                  3, // take three times the vertical space of other widgets in the same parent

              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => OnboardingScreenWidget( //takes index to show the right content
                  text1: splashData[index]['text1'],
                  text2: splashData[index]['text2'],
                  text3: splashData[index]['text3'],
                  image: splashData[index]["image"],
                  subtitle: splashData[index]["subtitle"],
                  button: splashData[index]["button"],
                  splashData:
                      splashData, //passing the splashData list to use it later
                  currentPage: currentPage,
                  index: index,
                  pageController: pageController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
