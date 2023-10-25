import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/forget_password/forget_password_cubit.dart';
import 'package:job_app/features/login/views/login_screen_view.dart';

import '../../../../models/api_model.dart';
import '../../../../utils/app_images.dart';
import '../create_new_password_screen_view.dart';
import 'check_email_screen.dart';
import 'create_new_password_body.dart';

class VerfiyEmailBody extends StatefulWidget {
  const VerfiyEmailBody({super.key});

  @override
  State<VerfiyEmailBody> createState() => _VerfiyEmailBodyState();
}

class _VerfiyEmailBodyState extends State<VerfiyEmailBody> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Back button icon
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreenView(),
                ),
              );
            },
          ),
          title: Container(
            margin: const EdgeInsets.only(left: 220),
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              AppImages.Klogo,
              width: 80,
              height: 50,
            ),
          ),
        ),
        body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
          if (state is ForgetPasswordLoading) {
            return const CircularProgressIndicator();
          } else if (state is ForgetPasswordSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email is correct!'),
                  // duration: Duration(seconds: 3),
                ),
              );
            });
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateNewPasswordScreenView(),
                ),
              );
            });
          } else if (state is ForgetPasswordFailure) {
            return Text('Verify Email failed: ${state.errorMessage}');
          }
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(right: 180),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 360, // Adjust the width as needed
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                ),
              ),
              const SizedBox(
                height: 390,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You remember your password',
                    style: TextStyle(color: Color(0xfffff9ca3af)),
                  ),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreenView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  // resetPassword(emailController.text.toString());
                  context.read<ForgetPasswordCubit>().forgetPassword(
                        emailController.text.toString().trim(),
                      );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: const Color(0xffffff3366ff),
                  fixedSize: const Size(340, 48),
                ),
                child: const Text(
                  "Request password reset",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ));
        }));
  }
}
