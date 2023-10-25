import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({super.key});

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.scale(
        scale: 1.3,
        child: Switch(
          value: isActive,
          activeColor: const Color(0XFFD6E4FF),
          inactiveThumbColor: const Color(0XFFF4F4F5),
          activeTrackColor: const Color(0XFF3366FF),
          inactiveTrackColor: const Color(0XFFD1D5DB),
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
          },
        ),
      ),
    );
  }
}
