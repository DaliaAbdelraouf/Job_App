import 'package:flutter/material.dart';
import 'package:job_app/features/messages/views/widgets/messages_view_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);
  static String id = 'MessagesView';
  // bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MessagesViewBody(),
      ),
    );
  }
}
