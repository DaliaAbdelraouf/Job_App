import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/register_cubit/register_cubit.dart';
import '../../../../utils/app_images.dart';

import '../../../login/views/login_screen_view.dart';
import '../../../onboarding/views/onboarding_view.dart';
import '../job_preferences_view.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  bool isPasswordValid = true;
  bool isPasswordFocused = false;
  bool hidePassword = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // void login(String name, String email, String password) async {
  //   final dio = Dio(); // Create a Dio instance

  //   try {
  //     final response = await dio.post(
  //       'https://project2.amit-learning.com/api/auth/register',
  //       data: {
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       print(data['token']);
  //       print('Login successfully');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Account created successfully!'),
  //           duration: Duration(seconds: 3),
  //         ),
  //       );
  //        Timer(Duration(seconds: 3), () {

  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => JobPreferencesView(),
  //           ),
  //         );
  //       }
  //
  // );
  //       // Navigator.pushReplacement(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) =>
  //       //         const JobPreferencesView(), // Replace with your screen widget
  //       //   ),
  //       // );
  //     } else {
  //       print('Failed');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Account creation failed please try again'),
  //           duration: Duration(seconds: 6),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

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
                  builder: (context) => const OnboardingScreenView(),
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
        body: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const CircularProgressIndicator();
            } else if (state is RegisterSuccess) {
              // return const Text('Account created successfully!');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account created successfully!'),
                    // duration: Duration(seconds: 3),
                  ),
                );
              });

              // After a delay, navigate to the next screen
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JobPreferencesView(),
                  ),
                );
              });
            } else if (state is EmailAlreadyTaken) {
              return Text('Email already taken: ${state.errorMessage}');
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 205),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 25,
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Please create an account to find your dream job',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                            // textAlign: TextAlign.left,
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
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 360,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          prefixIcon: const Icon(Icons
                              .email_outlined), // Icon inside the text field
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 360,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !hidePassword,
                        onChanged: (value) {
                          setState(() {
                            isPasswordValid = value.length >= 8;
                          });
                        },
                        onTap: () {
                          setState(() {
                            isPasswordFocused = true;
                          });
                        },
                        onFieldSubmitted: (_) {
                          setState(() {
                            isPasswordFocused = false;
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
                           suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                          errorText: !isPasswordValid
                              ? 'Password must be at least 8 characters'
                              : null,
                          errorStyle: TextStyle(
                            color: isPasswordValid ? Colors.grey : Colors.red,
                          ),
                          helperText: 'Password must be at least 8 characters',
                          helperStyle: TextStyle(
                            color: isPasswordFocused
                                ? (isPasswordValid ? Colors.green : Colors.red)
                                : Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordFocused
                                  ? (isPasswordValid ? Colors.grey : Colors.red)
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Already have an account?',
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
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // login(
                        //     nameController.text.toString(),
                        //     emailController.text.toString(),
                        //     passwordController.text.toString());
                        context.read<RegisterCubit>().register(
                              nameController.text.toString(),
                              emailController.text.toString(),
                              passwordController.text.toString(),
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
                        "Create account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80, // Width of the first line
                            height: 1, // Height of the lines
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "Or Sign up With Account",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 80,
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: const [
                        //       Icon(Icons.g_translate), // Replace with your desired icon
                        //       SizedBox(
                        //           width:
                        //               8), // Add some spacing between the icon and text
                        //       Text('Google'),
                        //     ],
                        //   ),
                        // ),
                        GoogleAuthButton(
                          //  onPressed: _signInWithGoogle, // Call the _signInWithGoogle method
                          onPressed: () {},
                          text: ' Google',
                          materialStyle: const ButtonStyle(
                              iconColor: MaterialStatePropertyAll(Colors.red)),
                          style: const AuthButtonStyle(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            buttonColor: Colors.white,
                            borderWidth: BorderSide.strokeAlignCenter,
                            height: 55,
                            width: 170,
                            borderRadius: 8,
                            borderColor: Colors.grey,
                            iconColor: Colors.red,
                            iconType: AuthIconType.secondary,
                            splashColor: Colors.red,
                          ),
                        ),

                        const SizedBox(width: 25),
                        FacebookAuthButton(
                          onPressed: () {},
                          text: ' Facebook',
                          style: const AuthButtonStyle(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            buttonColor: Colors.white,
                            borderWidth: BorderSide.strokeAlignCenter,
                            height: 55,
                            width: 170,
                            borderRadius: 8,
                            borderColor: Colors.grey,
                            iconType: AuthIconType.secondary,
                            splashColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
