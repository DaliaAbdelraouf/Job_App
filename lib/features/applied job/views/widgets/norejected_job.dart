import 'package:flutter/material.dart';

class RejectedJob extends StatelessWidget {
  const RejectedJob({super.key});

  @override
  Widget build(BuildContext context) {
    double circleSize = MediaQuery.of(context).size.width * 1.5;
    return Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 0.0,
            maxHeight: double.infinity,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 230, left: 100),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 15, opacity: 0.6),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 18, opacity: 0.6),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 200, top: 150),
                child:
                    Circle(color: Color(0xfffffd6e4ff), size: 24, opacity: 0.6),
              ),
              Circle(
                  color: const Color(0xfffffd6e4ff),
                  size: circleSize * 0.3,
                  opacity: 0.4),
              Circle(
                  color: const Color(0xfffffd6e4ff),
                  size: circleSize * 0.2,
                  opacity: 0.8),
              Image.asset(
                "assets/images/clipboard-close.png",
                width: 80,
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300, left: 45, right: 30),
                child: Column(children: const [
                  Text("No applications were rejected",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If there is an application that is rejected by the company it will appear here",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    // maxLines: 2,
                  ),
                ]),
              ),
            ],
          ),
        ));
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
        color: color.withOpacity(opacity), 
        shape: BoxShape.circle,
      ),
    );
  }
}
