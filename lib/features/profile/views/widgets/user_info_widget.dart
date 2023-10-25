import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              width: 91,
              child: Column(
                children: const [
                  Text(
                    "Applied",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "46",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(thickness: 1, width: 2, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              width: 91,
              child: Column(
                children: const [
                  Text(
                    "Reviewed",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "23",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(thickness: 1, width: 2, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              width: 91,
              child: Column(
                children: const [
                  Text(
                    "Contacted",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "16",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
