import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {super.key,
      this.onChanged,
      this.onSubmited,
      this.searchBarenabeld,
      this.ontap,
      this.suffixIcon,
      this.controller});

  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmited;
  final void Function()? ontap;
  final bool? searchBarenabeld;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 280,
          child: GestureDetector(
            onTap: widget.ontap,
            child: SizedBox(
              height: 48,
              child: TextFormField(
                controller: widget.controller,
                onFieldSubmitted: widget.onSubmited,
                onChanged: widget.onChanged,
                enabled: widget.searchBarenabeld,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search messages",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey, // Set the border color
              width: 1.0, // Set the border width
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: GestureDetector(
                onTap: () {},
                child: Image.asset("assets/images/setting-4.png")),
          ),
        )
      ],
    );
  }
}
