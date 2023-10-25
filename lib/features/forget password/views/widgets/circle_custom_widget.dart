import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;
  const Circle(
      {super.key,
      required this.color,
      required this.size,
      required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity), // Apply opacity to the color
        shape: BoxShape.circle,
      ),
    );
  }
}
