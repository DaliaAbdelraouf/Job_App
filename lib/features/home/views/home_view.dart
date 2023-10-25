import 'package:flutter/material.dart';
import 'package:job_app/features/home/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
