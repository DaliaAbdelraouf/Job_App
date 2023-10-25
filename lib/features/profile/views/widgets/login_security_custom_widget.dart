import 'package:flutter/material.dart';

class LoginSecurityCustomWidget extends StatelessWidget {
  const LoginSecurityCustomWidget(
      {super.key, required this.name, this.content, this.onTap});
  final String name;
  final String? content;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  content ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onTap,
                  child: const Icon(Icons.arrow_right_alt_sharp),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1)
      ],
    );
  }
}
