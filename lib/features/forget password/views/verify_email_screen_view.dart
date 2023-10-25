import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/forget_password/forget_password_cubit.dart';
import 'package:job_app/features/forget%20password/views/widgets/verify_email_screen_body.dart';

class VerifyEmailScreenView extends StatelessWidget {
  const VerifyEmailScreenView({super.key});
  static const String id = 'ResetPasswordScreenView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgetPasswordCubit(),
          child: const VerfiyEmailBody(),
        ),
      ),
    );
  }
}
