import 'package:flutter/material.dart';
import 'package:job_app/features/login/views/login_screen_view.dart';
import 'package:job_app/features/splash/views/widgets/splash_screen_circles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBody();
}

class _SplashViewBody extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  //mixin class that provides a vsync property for managing animations.
  late AnimationController animationController;
  late Animation<double> fadingAnimation;
  @override
  void initState() {
    super.initState();
    fadeAnimationInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //gradually changes the opacity over time (creating a fading effect)
        child: AnimatedOpacity(
          opacity: fadingAnimation.value,
          duration: const Duration(milliseconds: 600),
          child: const SplashCircleContainers(),
        ),
      ),
    );
  }

  void fadeAnimationInit() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ));

    fadingAnimation = Tween<double>(begin: .4, end: 1)
        .animate(animationController); //he range of opacity values
    animationController.repeat(reverse: true);

    animationController.addListener(() {
      //rebuild with the updated opacity
      setState(() {});
    });
    animationController.forward(); // Start the animation
  }
}
