import 'package:flutter/material.dart';

class ColorSwitchButton extends StatelessWidget {
  final String buttonText;
  final Color activeColor;
  final Color inactiveColor;
  final Function onPressed;
  final bool isActive;

  const ColorSwitchButton({
    Key? key,
    required this.buttonText,
    required this.activeColor,
    required this.inactiveColor,
    required this.onPressed,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: isActive ? activeColor : inactiveColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 14,
            color: isActive ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
