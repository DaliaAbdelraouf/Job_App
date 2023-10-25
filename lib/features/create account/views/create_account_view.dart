import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_app/features/create%20account/views/widgets/create_account_veiw_body.dart';

import '../../../cubits/register_cubit/register_cubit.dart';



class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});
  static const String id = 'CreateAccountView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: CreateAccountViewBody(),
        ),
      ),
    );
  }
}
