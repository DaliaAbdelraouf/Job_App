import 'package:flutter/material.dart';

class MessagesModel {
  final String? messageImage;
  final IconData? messageIcon;
  final String messageTitle;
  final String messageSubTitle;
  final String messageTime;
  final Color? timeColor;

  MessagesModel(
      {this.messageImage,
      this.messageIcon,
      required this.messageTitle,
      required this.messageSubTitle,
      required this.messageTime,
      this.timeColor});
}
