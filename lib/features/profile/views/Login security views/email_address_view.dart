import 'package:flutter/material.dart';

import '../login_security_view.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key, required this.emailAddress});
  final String emailAddress;
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
                builder: (context) => const LoginAndSecurityView(),
              ),
            );
          },
        ),
        title: Row(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Email Address',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 44),
            const Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                "Main e-mail address",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: emailAddress,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Border color
                    width: 2, // Border width
                  ),
                ),
                prefixIcon: const Icon(Icons.sms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
