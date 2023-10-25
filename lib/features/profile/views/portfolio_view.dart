import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/portfolio_cubit/cubit/add_cv_portfolio_cubit.dart';
import 'package:job_app/features/profile/views/profile_view.dart';
import 'package:job_app/features/profile/views/widgets/portfolio_view_body.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ),
            );
          },
        ),
        title: Row(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddCvPortfolioCubit(),
          child: const PortfolioViewBody(),
        ),
      ),
    );
  }
}
