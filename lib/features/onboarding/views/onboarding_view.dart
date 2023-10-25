import 'package:flutter/material.dart';
import 'package:job_app/features/onboarding/views/widgets/onboarding_view_body.dart';

class OnboardingScreenView extends StatelessWidget {
  const OnboardingScreenView({super.key});
  static const String id = 'FirstOnboardingView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnboardingViewBody(),
      ),
    );
  }
}
