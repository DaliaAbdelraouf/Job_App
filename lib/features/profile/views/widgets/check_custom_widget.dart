import 'package:flutter/material.dart';

class CheckCircle extends StatelessWidget {
  const CheckCircle({super.key, required this.isSelected, this.onTap});
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue),
            shape: BoxShape.circle),
        child: isSelected == true
            ? Center(
                child: Container(
                  height: 18,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
