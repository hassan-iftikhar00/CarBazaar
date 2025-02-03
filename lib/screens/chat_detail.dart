import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';

class ChatDetailPage extends StatelessWidget {
  final String userName;

  const ChatDetailPage({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: ReusableText(
          userName,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildChatBubble('Hello!', true),
                  _buildChatBubble('Hi, how can I help you?', false),
                  _buildChatBubble('I am interested in your car.', true),
                  _buildChatBubble('Great! It is still available.', false),
                  _buildChatBubble('Can we schedule a meeting?', true),
                  _buildChatBubble(
                      'Sure, let me know your availability.', false),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            color: appbarbackgroundColor,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: whiteColor),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: blueColor),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isSentByMe) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSentByMe ? blueColor : cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ReusableText(
          text,
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
