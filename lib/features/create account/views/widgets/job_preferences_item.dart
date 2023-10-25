import 'package:flutter/material.dart';

class JobPreferenceItem extends StatefulWidget {
  final String? imagePath;
  final String? title;

  const JobPreferenceItem({
    Key? key,
    this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  State<JobPreferenceItem> createState() => _JobPreferenceItemState();
}

class _JobPreferenceItemState extends State<JobPreferenceItem> {
  bool isContainerClicked = false; // Initial state
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isContainerClicked = !isContainerClicked;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isContainerClicked
                ? const Color(
                    0xffff3366ff) // Change to your desired clicked color
                : const Color(0xfffffd6e4ff),
            width: 1.6,
          ),
          color: isContainerClicked
              ? Colors.blue.withOpacity(
                  0.2) // Change to your desired clicked color with opacity
              : const Color(0xfffffafafa),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              backgroundImage: AssetImage(widget.imagePath ?? ''),
            ),
            const SizedBox(height: 35),
            Text(
              widget.title ?? '',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
