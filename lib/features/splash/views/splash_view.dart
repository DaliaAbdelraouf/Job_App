import 'package:job_app/features/splash/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

import '../../onboarding/views/onboarding_view.dart';



class SplashView extends StatefulWidget {
  static const String id = 'Splashview';

  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigationControl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void navigationControl() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, OnboardingScreenView.id);
      },
    );
  }
}
