import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/forget%20password/views/widgets/create_new_password_body.dart';

import '../../../cubits/reset_password/reset_password_cubit.dart';

class CreateNewPasswordScreenView extends StatelessWidget {
  const CreateNewPasswordScreenView({super.key});
  static const String id = 'CreateNewPasswordScreenView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: const CreateNewPasswordBody(),
        ),
      ),
    );
  }
}
