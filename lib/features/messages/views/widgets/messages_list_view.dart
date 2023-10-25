import 'package:flutter/material.dart';

import '../../../../models/messages_model.dart';
import 'messages_custom_widget.dart';

class MessagesListView extends StatelessWidget {
  MessagesListView({super.key});
  List<MessagesModel> messageData = [
    MessagesModel(
      messageImage: "assets/images/Twitter Logo (1).png",
      messageTitle: "Twitter",
      messageSubTitle: "Here is the link: http://zoom.com/abcdeefg",
      messageTime: "12.20 pm",
    ),
    MessagesModel(
      messageImage: "assets/images/Gojek Logo.png",
      messageTitle: "Gojek Indonesia",
      messageSubTitle: "lets keep in touch",
      messageTime: "10.33 pm",
    ),
    MessagesModel(
      messageImage: "assets/images/Shoope Logo.png",
      messageTitle: "Shoope",
      messageSubTitle: "Thank you Dalia",
      messageTime: "10.33 pm",
    ),
    MessagesModel(
      messageImage: "assets/images/Slack Logo.png",
      messageTitle: "Slack",
      messageSubTitle: "You: I Look Forward to hearing from you",
      messageTime: "12/8",
    ),
    MessagesModel(
      messageImage: "assets/images/Facebook Logo.png",
      messageTitle: "Facebook",
      messageSubTitle: "You: what about the interview stage",
      messageTime: "12/8",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * messageData.length,
      child: ListView.builder(
        itemCount: messageData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: GestureDetector(
              onTap: () {
                //   Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ChatView(),
                //   ),
                // );
              },
              child: MessagesCustomWidget(
                message: messageData[index],
                imageHieght: 44,
                imageWidth: 44,
              ),
            ),
          );
        },
      ),
    );
  }
}
