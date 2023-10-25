import 'package:flutter/material.dart';
import 'package:job_app/features/profile/views/widgets/switch_button_widget.dart';

class NotificationCustomWidget extends StatefulWidget {
  const NotificationCustomWidget({super.key, required this.notificationTitle});
  final String notificationTitle;
  @override
  State<NotificationCustomWidget> createState() =>
      _NotificationCustomWidgetState();
}

class _NotificationCustomWidgetState extends State<NotificationCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.notificationTitle,
              // fontfamily: textFamilyRegular,
            ),
            const SwitchButtonWidget()
          ],
        ),
        const SizedBox(height: 10.5),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
