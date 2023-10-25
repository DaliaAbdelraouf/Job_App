import 'package:flutter/material.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("No search result yet"),
    );
  }
}
