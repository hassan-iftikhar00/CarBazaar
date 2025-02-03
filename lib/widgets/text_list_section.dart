import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';

class TextListSection extends StatelessWidget {
  final List<String> items;

  const TextListSection({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i += 2)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReusableText(items[i], style: TextStyle(color: whiteColor)),
                if (i + 1 < items.length)
                  ReusableText(items[i + 1],
                      style: TextStyle(color: whiteColor)),
              ],
            ),
          ),
      ],
    );
  }
}
