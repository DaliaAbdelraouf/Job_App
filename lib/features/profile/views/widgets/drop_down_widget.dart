import 'package:flutter/material.dart';

class DropDrownWidget extends StatefulWidget {
  const DropDrownWidget(
      {super.key, required this.Title, required this.Content});
  final String Title;
  final String Content;

  @override
  State<DropDrownWidget> createState() => _DropDrownWidgetState();
}

class _DropDrownWidgetState extends State<DropDrownWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.Title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded == true
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0XFF9CA3AF),
                    size: 20,
                  ),
                )
              ],
            ),
            isExpanded != false
                ? Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        widget.Content,
                        style: const TextStyle(color: Color(0XFF6B7280)),
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
