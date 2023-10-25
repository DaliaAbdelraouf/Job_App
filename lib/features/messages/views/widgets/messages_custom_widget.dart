import 'package:flutter/material.dart';
import 'package:job_app/models/messages_model.dart';

class MessagesCustomWidget extends StatelessWidget {
  const MessagesCustomWidget(
      {super.key, required this.message, this.imageHieght, this.imageWidth});

  final MessagesModel message;
  // bool? rightPartPoint = false;
  final double? imageHieght;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 55,
                height: 55,
                child: Image.asset(message.messageImage ?? '')),
            const SizedBox(width: 11),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(message.messageTitle),
                      Row(
                        children: [
                          Text(
                            message.messageTime,
                            style: const TextStyle(color: Colors.blue),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 279,
                    child: Text(
                      message.messageSubTitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
