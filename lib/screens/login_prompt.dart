import 'package:flutter/material.dart';
import 'package:project/bottomNavBar/bottomNavBar.dart';
import '../utils/colors.dart';
import 'login.dart';

class LoginPromptPage extends StatelessWidget {
  final int redirectIndex;

  const LoginPromptPage({super.key, required this.redirectIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/illustrations/access-denied.png',
                  height: 200),
              SizedBox(height: 30),
              Text(
                'Please login to view this page',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                          fromMorePage: false, redirectIndex: redirectIndex),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: whiteColor, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
