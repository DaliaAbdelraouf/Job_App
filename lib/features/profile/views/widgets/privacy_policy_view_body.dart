import 'package:flutter/material.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 32),
          Text(
            "Your privacy is important",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          ),
          SizedBox(height: 12),
          Text(
            "Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          ),
          SizedBox(height: 24),
          Text(
            "Data controllers and contract    partners",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.",
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          )
        ],
      ),
    );
  }
}
