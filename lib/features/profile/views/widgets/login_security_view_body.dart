import 'package:flutter/material.dart';
import 'package:job_app/models/api_model.dart';

import '../../../forget password/views/create_new_password_screen_view.dart';
import '../Login security views/email_address_view.dart';
import 'login_security_custom_widget.dart';

class LoginAndSecurityViewBody extends StatelessWidget {
  const LoginAndSecurityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: SharedPreferencesUtil.getEmail(),
        builder: (context, snapshot) {
          print('Email retrieved from SharedPreferences: ${snapshot.data}');
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color(0xfffffe5e7eb),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Account Access",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [
                  LoginSecurityCustomWidget(
                    name: "Email address",
                    content: snapshot.data,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailView(
                              emailAddress: snapshot.data ?? '',
                            ),
                          ));
                    },
                  ),
                  LoginSecurityCustomWidget(
                    name: "Phone Number",
                    onTap: () {
                     
                    },
                  ),
                  LoginSecurityCustomWidget(
                    name: "Change Password",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CreateNewPasswordScreenView(),
                          ));
                    },
                  ),
                  LoginSecurityCustomWidget(
                    name: "Two-step verification",
                    content: "Non active",
                    onTap: () {
                     
                    },
                  ),
                  const LoginSecurityCustomWidget(
                    name: "Face ID",
                  ),
                ]),
              )
            ],
          );
        });
  }
}
