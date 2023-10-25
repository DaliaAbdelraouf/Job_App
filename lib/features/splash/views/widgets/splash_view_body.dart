import 'package:flutter/material.dart';
import 'package:job_app/features/splash/views/widgets/splash_screen_circles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBody();
}

class _SplashViewBody extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
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

    fadingAnimation =
        Tween<double>(begin: .4, end: 1).animate(animationController);
    animationController.repeat(reverse: true);

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward(); // Start the animation
  }
}
