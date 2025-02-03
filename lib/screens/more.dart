import 'package:flutter/material.dart';
import 'package:project/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/auth_provider.dart';
import '../utils/colors.dart';
import 'login.dart';

class MorePage extends StatelessWidget {
  const MorePage(
      {super.key, required String username, required bool isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: Text(
          morePageHeading,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (authProvider.isLoggedIn)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, ${authProvider.username}!',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Explore more features and enjoy!',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              _buildSection('Personal', [
                {'icon': Icons.person, 'text': 'My Activity'},
                {'icon': Icons.credit_card, 'text': 'My Credits'},
                {'icon': Icons.notifications, 'text': 'Alerts'},
                {'icon': Icons.notifications_active, 'text': 'Notifications'},
                {'icon': Icons.color_lens, 'text': 'Theme'},
                {'icon': Icons.language, 'text': 'Choose Language'},
              ]),
              SizedBox(height: 5),
              _buildSection('Products', [
                {'icon': Icons.sell, 'text': 'Sell My Car'},
                {'icon': Icons.directions_car, 'text': 'Buy Used Car'},
                {'icon': Icons.new_releases, 'text': 'Buy New Car'},
                {'icon': Icons.car_repair, 'text': 'Order Car Inspection'},
                {'icon': Icons.build, 'text': 'Auto Services'},
              ]),
              SizedBox(height: 5),
              _buildSection('Explore', [
                {'icon': Icons.article, 'text': 'Blog'},
                {'icon': Icons.video_library, 'text': 'Videos'},
                {'icon': Icons.directions_bike, 'text': 'Cool Rides'},
              ]),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (authProvider.isLoggedIn) {
                      authProvider.logout();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(fromMorePage: true),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    authProvider.isLoggedIn ? logoutText : 'Login',
                    style: TextStyle(color: whiteColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(appName,
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.w900)),
                    Text(
                      appVersion,
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String header, List<Map<String, dynamic>> options) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: cardBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  for (var option in options)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(option['icon'], color: whiteColor),
                          SizedBox(width: 10),
                          Text(
                            option['text'],
                            style: TextStyle(color: whiteColor, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
