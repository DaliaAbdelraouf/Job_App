import 'package:flutter/material.dart';

class ChoiceMenu extends StatefulWidget {
  final ValueChanged<String> onChoiceSelected;
  const ChoiceMenu({Key? key, required this.onChoiceSelected})
      : super(key: key);
  @override
  _ChoiceMenuState createState() => _ChoiceMenuState();
}

class _ChoiceMenuState extends State<ChoiceMenu> {
  String selectedChoice = ''; // Initialize with an empty string

  void handleChoice(String choice) {
    setState(() {
      selectedChoice = choice;
    });
    widget.onChoiceSelected(choice);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildChoiceContainer(0, ' Senior UX Designer'),
        const SizedBox(height: 8),
        buildChoiceContainer(1, ' Senior UI Designer'),
        const SizedBox(height: 8),
        buildChoiceContainer(2, ' Graphic Designer  '),
        const SizedBox(height: 8),
        buildChoiceContainer(3, 'Front-End Developer'),
      ],
    );
  }

  Widget buildChoiceContainer(int choice, String choiceName) {
    return InkWell( //makes the choice container tappable
      onTap: () {
        handleChoice(choiceName);
      },
      child: Container(
        height: 90,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                choiceName, // Display choice name here
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: selectedChoice == choiceName
                      ? const Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: 18,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
