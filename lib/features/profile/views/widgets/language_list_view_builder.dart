import 'package:flutter/material.dart';

import 'check_custom_widget.dart';
import 'language_model.dart';

class LanguageListViewBuilder extends StatefulWidget {
  const LanguageListViewBuilder({super.key});

  @override
  State<LanguageListViewBuilder> createState() =>
      _LanguageListViewBuilderState();
}

class _LanguageListViewBuilderState extends State<LanguageListViewBuilder> {
  List<LanguageModel> languageData = [
    LanguageModel(
      languageCountry: "assets/images/England.png",
      language: "English",
      isSelected: true,
    ),
    LanguageModel(
      languageCountry: "assets/images/Indonesia1.png",
      language: "Indonesia",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/Saudi Arabia.png",
      language: "Arabic",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/China1.png",
      language: "Chinese",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/Netherlands.png",
      language: "Dutch",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/France.png",
      language: "French",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/Germany.png",
      language: "German",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/Japan.png",
      language: "Japanese",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/South Korea.png",
      language: "Korean",
      isSelected: false,
    ),
    LanguageModel(
      languageCountry: "assets/images/Portugal.png",
      language: "Portuguese",
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: languageData.length,
        itemBuilder: (context, index) {
          final languageModel = languageData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(languageModel.languageCountry),
                    const SizedBox(width: 12),
                    Text(languageModel.language),
                    const Spacer(),
                    CheckCircle(
                      isSelected: languageModel.isSelected,
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < languageData.length; i++) {
                            if (i == index) {
                              languageData[i].isSelected = true;
                            } else {
                              languageData[i].isSelected = false;
                            }
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
