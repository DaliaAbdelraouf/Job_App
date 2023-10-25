import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/cubit/login_cubit.dart';
import 'package:job_app/features/login/views/widgets/login_screen_body.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});
  static const String id = 'LoginScreenView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubitCubit(),
          child: const LoginScreenViewBody(),
        ),
      ),
    );
  }
}
