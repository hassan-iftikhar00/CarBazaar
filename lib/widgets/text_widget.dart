import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double fontSize;
  final FontWeight fontWeight;

  const ReusableText(
    this.text, {
    super.key,
    this.style,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? Theme.of(context).textTheme.bodyMedium;

    return Text(
      text,
      style: defaultStyle?.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: style?.color ?? whiteTextStyle.color,
      ),
    );
  }
}
