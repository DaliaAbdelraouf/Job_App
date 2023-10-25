import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption({
    Key? key,
    this.image,
    required this.title,
    this.onTap,
    this.rightPart,
    this.height,
  }) : super(key: key);

  final ImageProvider? image; // Use ImageProvider for images
  final String title;
  final void Function()? onTap;
  final Widget? rightPart;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height ?? 14),
        Row(
          children: [
            if (image != null)
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffffd6e4ff),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: CircleAvatar(
                      // Use CircleAvatar to display images
                      backgroundImage: image,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      radius: 15),
                ),
              )
            else
              Container(),
            SizedBox(width: image != null ? 12 : 0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: rightPart ??
                  GestureDetector(
                    onTap: onTap,
                    child: const Icon(
                      Icons.arrow_right_alt_sharp,
                    ),
                  ),
            ),
          ],
        ),
        SizedBox(height: height ?? 14),
        const Divider(
          thickness: 1,
          // color: AppColors.appNeutralColors200,
        ),
      ],
    );
  }
}
