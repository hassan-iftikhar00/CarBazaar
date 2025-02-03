import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';

class ChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String adName;
  final String date;

  const ChatItem({
    required this.imagePath,
    required this.name,
    required this.adName,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: ReusableText(name,
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(adName, style: TextStyle(color: whiteColor)),
            SizedBox(height: 5),
            ReusableText(date,
                style: TextStyle(color: lightBlue, fontSize: 12)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: whiteColor, size: 16),
      ),
    );
  }
}
