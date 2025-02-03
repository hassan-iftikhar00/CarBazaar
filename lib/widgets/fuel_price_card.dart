import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';

class FuelPriceCard extends StatelessWidget {
  final Map<String, String> fuelPrices;

  const FuelPriceCard({
    required this.fuelPrices,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> fuelPriceRows = [];
    fuelPrices.forEach((fuelType, pricePerLiter) {
      fuelPriceRows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(fuelType, style: TextStyle(color: whiteColor)),
              ReusableText(pricePerLiter,
                  style: TextStyle(
                      color: whiteColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    });

    return Card(
      color: cardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fuelPriceRows,
        ),
      ),
    );
  }
}
