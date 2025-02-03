import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/screens/ads.dart';
import 'package:project/screens/chat.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/more.dart';
import 'package:project/screens/sell_now.dart';
import 'package:project/utils/colors.dart';
import 'package:project/screens/login_prompt.dart';
import 'package:project/providers/auth_provider.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void onItemTap(int index) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isLoggedIn && (index == 1 || index == 2 || index == 3)) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPromptPage(redirectIndex: index),
        ),
      );
      if (result != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            selectedIndex = result;
          });
        });
      }
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final List<Widget> widgetOptions = <Widget>[
      const HomePage(),
      authProvider.isLoggedIn
          ? const AdsPage()
          : LoginPromptPage(redirectIndex: 1),
      authProvider.isLoggedIn
          ? const SellNowPage()
          : LoginPromptPage(redirectIndex: 2),
      authProvider.isLoggedIn
          ? const ChatPage()
          : LoginPromptPage(redirectIndex: 3),
      MorePage(
          username: authProvider.username, isLoggedIn: authProvider.isLoggedIn),
    ];

    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTap,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        selectedItemColor: lightBlue,
        unselectedItemColor: Colors.white,
        backgroundColor: bottomNavBg,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: bottomNavBg,
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? lightBlue : whiteColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavBg,
            icon: Icon(
              Icons.campaign,
              color: selectedIndex == 1 ? lightBlue : whiteColor,
            ),
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavBg,
            icon: Icon(
              Icons.add_circle,
              color: blueColor,
            ),
            label: 'Sell Now',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavBg,
            icon: Icon(
              Icons.chat,
              color: selectedIndex == 3 ? lightBlue : whiteColor,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            backgroundColor: bottomNavBg,
            icon: Icon(
              Icons.menu,
              color: selectedIndex == 4 ? lightBlue : whiteColor,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
