import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../widgets/chat_item.dart';
import 'chat_detail.dart';
import 'login_prompt.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;

    if (!isLoggedIn) {
      return LoginPromptPage(redirectIndex: 1);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: ReusableText(
          chatPageHeading,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search chats...',
                hintStyle: TextStyle(color: whiteColor),
                prefixIcon: Icon(Icons.search, color: whiteColor),
                filled: true,
                fillColor: cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: whiteColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blueColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: whiteColor),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(userName: 'Abdul Wahab'),
                      ),
                    );
                  },
                  child: ChatItem(
                    imagePath: '/pfp/user1.jpg',
                    name: 'Abdul Wahab',
                    adName: 'Toyota Yaris HatchBack',
                    date: '12/10/2023',
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(userName: 'Hassan'),
                      ),
                    );
                  },
                  child: ChatItem(
                    imagePath: '/pfp/user2.jpg',
                    name: 'Hassan',
                    adName: 'Toyota Aqua S',
                    date: '11/10/2023',
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(userName: 'Maarij'),
                      ),
                    );
                  },
                  child: ChatItem(
                    imagePath: '/pfp/user3.jpg',
                    name: 'Maarij',
                    adName: 'Toyota Prado TXL Package',
                    date: '10/10/2023',
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(userName: 'Zainab'),
                      ),
                    );
                  },
                  child: ChatItem(
                    imagePath: '/pfp/user4.jpg',
                    name: 'Zainab',
                    adName: 'Porsche Taycan Base Model',
                    date: '09/10/2023',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
