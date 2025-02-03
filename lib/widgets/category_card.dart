import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CategoryCard extends StatelessWidget {
  final IconData iconData;
  final String text;

  const CategoryCard({
    required this.iconData,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(iconData, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
