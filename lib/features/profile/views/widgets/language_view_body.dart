import 'package:flutter/material.dart';
import 'language_list_view_builder.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(height: 48),
          LanguageListViewBuilder(),
        ],
      ),
    );
  }
}
