import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';

class AdCard extends StatelessWidget {
  final String imagePath;
  final String carName;
  final String price;
  final String city;
  final String details;

  const AdCard({
    required this.imagePath,
    required this.carName,
    required this.price,
    required this.city,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 200, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(carName,
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  ReusableText(price, style: TextStyle(color: whiteColor)),
                  SizedBox(height: 5),
                  ReusableText(city, style: TextStyle(color: whiteColor)),
                  SizedBox(height: 5),
                  ReusableText(details, style: TextStyle(color: whiteColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
