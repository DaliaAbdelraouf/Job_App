import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_images.dart';
import '../../../create account/views/create_account_view.dart';
import '../../../forget password/views/verify_email_screen_view.dart';
import '../../../home/views/widgets/app_navigation_logic.dart';
import '../../../home/views/widgets/home_view_body.dart';

class LoginScreenViewBody extends StatefulWidget {
  const LoginScreenViewBody({super.key});

  @override
  State<LoginScreenViewBody> createState() => _LoginScreenViewBodyState();
}

class _LoginScreenViewBodyState extends State<LoginScreenViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  String errorMessage = '';
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    _loadSavedCheckboxState(); // Load the saved checkbox state
  }

  // Load the saved checkbox state from SharedPreferences
  Future<void> _loadSavedCheckboxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = prefs.getBool('rememberMe') ?? false;
    });
  }

  // Save the checkbox state to SharedPreferences
  Future<void> _saveCheckboxState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
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
                builder: (context) => const CreateAccountView(),
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
      body: BlocBuilder<LoginCubitCubit, LoginCubitState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return const CircularProgressIndicator();
          } else if (state is LoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login success!'),
                  // duration: Duration(seconds: 3),
                ),
              );
            });
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppNavigationLogic(),
                ),
              );
            });
          } else if (state is LoginFailure) {
            errorMessage = state.errorMessage;
            return Text('Login failed: ${state.errorMessage}');
          }
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 300),
                  child: Text(
                    'Login',
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Please login to find your dream job',
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
                    controller: emailController,
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
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
                  height: 10,
                ),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    controller: passwordController,
                    key: const ValueKey('password'),
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      // You can have both a prefixIcon and a suffixIcon.
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorText: errorMessage.isNotEmpty ? errorMessage : null,
                    ),
                  ),
                ),
                Text(errorMessage.isNotEmpty ? errorMessage : ''),
                // Display error message when login fails

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.4, color: Colors.grey),
                        ),
                        value: _isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            _isChecked =
                                newValue ?? false; // Handle null safety
                            _saveCheckboxState(
                                _isChecked); // Save the state to SharedPreferences
                          });
                        },
                      ),
                      const Text('Remember Me'),
                      const SizedBox(
                        width: 95,
                      ),
                      TextButton(
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VerifyEmailScreenView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Dont’t have an account?',
                      style: TextStyle(color: Color(0xfffff9ca3af)),
                    ),
                    TextButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccountView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginCubitCubit>().login(
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
                    "Login",
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
                        "Or Login With Account",
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
                  
                    GoogleAuthButton(
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
              ]),
            ),
          );
        },
      ),
    );
  }
}
