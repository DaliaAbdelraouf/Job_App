import 'package:flutter/material.dart';

import '../../../home/views/widgets/search_bar_widget.dart';
import 'drop_down_widget.dart';

class HelpCenterViewBody extends StatelessWidget {
  const HelpCenterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(children: const [
          SizedBox(height: 30),
          SearchBarWidget(
            hintText: 'What can we help',
          ),
          SizedBox(height: 20),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
          DropDrownWidget(
            Title: "Lorem ipsum dolor sit amet",
            Content:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
          ),
          SizedBox(height: 15),
        ]),
      ),
    );
  }
}
