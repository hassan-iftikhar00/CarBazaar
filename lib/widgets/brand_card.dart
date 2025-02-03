import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BrandCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const BrandCard({
    required this.imagePath,
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
            Image.asset(imagePath, width: 50, height: 50),
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
