import 'package:flutter/material.dart';

import '../../../../utils/app_images.dart';

class SplashCircleContainers extends StatelessWidget {
  const SplashCircleContainers({super.key});

  @override
  Widget build(BuildContext context) {
    double circleSize =
        MediaQuery.of(context).size.width * 1.5; 
    return OverflowBox(
      minWidth: 0.0,
      maxWidth: double.infinity,
      minHeight: 0.0,
      maxHeight: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Circle(
              color: const Color(0xfffffd6e4ff),
              size: circleSize,
              opacity: 0.2),
          Circle(
              color: const Color(0xfffffd6e4ff),
              size: circleSize * 0.8,
              opacity: 0.4),
          Circle(
              color: const Color(0xfffffd6e4ff),
              size: circleSize * 0.6,
              opacity: 0.6),
          Circle(
              color: const Color(0xfffffd6e4ff),
              size: circleSize * 0.4,
              opacity: 0.8),
          Image.asset(
            AppImages.Klogo, 
            width: 100, // Adjust the size of your logo as needed
            height: 100,
          ),
        ],
      ),
    );
  }
}

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
