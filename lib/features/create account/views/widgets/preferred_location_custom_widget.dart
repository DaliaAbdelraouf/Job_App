import 'package:flutter/material.dart';

class PreferredLocationCustomWidget extends StatefulWidget {
  final String? imagePath;
  final String? title;

  const PreferredLocationCustomWidget({
    Key? key,
    this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  State<PreferredLocationCustomWidget> createState() =>
      _PreferredLocationCustomWidgetState();
}

class _PreferredLocationCustomWidgetState
    extends State<PreferredLocationCustomWidget> {
  bool isContainerClicked = false; // Initial state
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isContainerClicked = !isContainerClicked;
        });
      },
      child: IntrinsicWidth(
        child: Container(
          // width: 137,
          height: 45,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: isContainerClicked
                  ? const Color(0xffff3366ff)
                  : const Color(0xfffffd6e4ff),
              // width: 1.3,
            ),
            color: isContainerClicked
                ? Colors.blue.withOpacity(0.2)
                : const Color(0xfffffafafa),
            // borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   radius: 30,
              //   backgroundImage: AssetImage(widget.imagePath ?? ''),
              // ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Image(
                  image: AssetImage(widget.imagePath ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              // const SizedBox(width: ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
