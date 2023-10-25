import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/reset_password/reset_password_cubit.dart';
import 'package:job_app/features/forget%20password/views/widgets/verify_email_screen_body.dart';
import 'package:job_app/features/login/views/login_screen_view.dart';

import '../../../../utils/app_images.dart';
import '../../../profile/views/login_security_view.dart';

class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({super.key});

  @override
  State<CreateNewPasswordBody> createState() => _CreateNewPasswordBodyState();
}

class _CreateNewPasswordBodyState extends State<CreateNewPasswordBody> {
  bool isPasswordValid = true;
  bool isPasswordFocused = false;

  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
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
                  builder: (context) => const LoginAndSecurityView(),
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
        body: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            if (state is ResetPasswordLoading) {
              return const CircularProgressIndicator();
            } else if (state is ResetPasswordSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password Changed successfully!'),
                    duration: Duration(seconds: 3),
                  ),
                );
              });
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreenView(),
                  ),
                );
              });
            } else if (state is ResetPasswordFailure) {
              return Text('Create New Password Failed: ${state.errorMessage}');
            }
            return SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 120),
                          child: Text(
                            'Create new password',
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
                                  'Set your new password so you can login and access Jobsque',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
                          width: 360,
                          child: TextFormField(
                            controller: passwordController1,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                isPasswordValid = value.length >= 8 &&
                                    value == passwordController2.text;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline),
                              errorText: !isPasswordValid
                                  ? 'Password must be at least 8 characters and match'
                                  : null,
                              errorStyle: TextStyle(
                                color:
                                    isPasswordValid ? Colors.grey : Colors.red,
                              ),
                              helperText:
                                  'Password must be at least 8 characters and match',
                              helperStyle: TextStyle(
                                color:
                                    isPasswordValid ? Colors.green : Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: isPasswordValid
                                      ? Colors.grey
                                      : Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            controller: passwordController2,
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                isPasswordValid = value.length >= 8 &&
                                    value == passwordController1.text;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline),
                              errorText: !isPasswordValid
                                  ? 'Both password must match'
                                  : null,
                              errorStyle: TextStyle(
                                color:
                                    isPasswordValid ? Colors.grey : Colors.red,
                              ),
                              helperText: 'Both password match',
                              helperStyle: TextStyle(
                                color:
                                    isPasswordValid ? Colors.green : Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: isPasswordValid
                                      ? Colors.grey
                                      : Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 330),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<ResetPasswordCubit>().resetPassword(
                                    passwordController2.text.toString().trim(),
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
                              "Reset Password",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )));
          },
        ));
  }
}
