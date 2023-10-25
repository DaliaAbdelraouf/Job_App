import 'package:flutter/material.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Text(
            "Lorem ipsum dolor",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec  feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam  vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          ),
          const SizedBox(height: 17),
          const Text(
            "Lorem ipsum dolor",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          const Text(
            "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          ),
          const SizedBox(height: 12),
          Container(
            color: const Color(0xffff4f4f5),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style: TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          )
        ],
      ),
    );
  }
}
