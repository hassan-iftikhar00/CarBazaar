import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/screens/sell_now.dart';
import 'package:project/screens/login_prompt.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../widgets/ad_card.dart';
import '../providers/auth_provider.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    bool isLoggedIn = authProvider.isLoggedIn;

    if (!isLoggedIn) {
      return LoginPromptPage(
        redirectIndex: 0,
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: Text(
          myAds,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  adsCount,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AdCard(
                      imagePath: 'assets/ad_images/ad3/ad3-1.webp',
                      carName: 'Toyota Hilux Revo V',
                      price: 'PKR 2,000,000',
                      city: 'Karachi',
                      details: '2018 | 50,000 km | Petrol',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AdCard(
                      imagePath: 'assets/ad_images/ad15/ad15-1.webp',
                      carName: 'Audi E-Tron GT',
                      price: 'PKR 1,200,000',
                      city: 'Islamabad',
                      details: '2020 | 20,000 km | Electric',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/illustrations/keys-handover.png'),
                          height: 200,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                addMoreAds,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SellNowPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: blueColor,
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                ),
                                child: Text(
                                  sellNowPageHeading,
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
