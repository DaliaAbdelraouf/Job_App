import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget(
      {super.key,
      required this.hintText,
      this.onChanged,
      this.onSubmited,
      this.searchBarEnabeld,
      this.ontap,
      this.Icon,
      this.controller});
  final String hintText;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmited;
  final void Function()? ontap;
  final bool? searchBarEnabeld;
  final IconData? Icon;
  final TextEditingController? controller;
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: SizedBox(
        height: 48,
        child: TextFormField(
          controller: widget.controller,
          onFieldSubmitted: widget.onSubmited,
          onChanged: widget.onChanged,
          enabled: widget.searchBarEnabeld,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: widget.controller != null
                ? widget.controller!.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.controller!.clear();
                          });
                        },
                        icon: Icon(widget.Icon))
                    : null
                : null,
            hintText: widget.hintText,
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
    );
  }
}
