import 'package:flutter/material.dart';
import 'package:project/screens/ad_details.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/auth_provider.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../widgets/text_widget.dart';
import '../widgets/category_card.dart';
import '../widgets/brand_card.dart';
import '../widgets/text_list_section.dart';
import '../widgets/ad_card.dart';
import '../widgets/fuel_price_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedOption = usedCars;
  String selectedBrowseOption = categories;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildOptionButton(usedCars),
              SizedBox(width: 10),
              _buildOptionButton(newCars),
              SizedBox(width: 10),
              _buildOptionButton(bikes),
              SizedBox(width: 10),
              _buildOptionButton(autostore),
            ],
          ),
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
                              welcomeMessage,
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 15,
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
              Container(
                color: appbarbackgroundColor,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: searchUsedCarsHint,
                    hintStyle: TextStyle(color: whiteColor),
                    prefixIcon: Icon(Icons.search, color: whiteColor),
                    border: OutlineInputBorder(),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableText('|'),
                        SizedBox(width: 3),
                        Icon(
                          Icons.location_on,
                          size: 17,
                          color: whiteColor,
                        ),
                        ReusableText(allCities),
                        SizedBox(width: 7),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ReusableText(browseUsedCars,
                  fontSize: 18, fontWeight: FontWeight.bold),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBrowseOptionButton(categories),
                    SizedBox(width: 30),
                    _buildBrowseOptionButton(budget),
                    SizedBox(width: 30),
                    _buildBrowseOptionButton(brand),
                    SizedBox(width: 30),
                    _buildBrowseOptionButton(model),
                    SizedBox(width: 30),
                    _buildBrowseOptionButton(cities),
                    SizedBox(width: 30),
                  ],
                ),
              ),
              SizedBox(height: 20),
              if (selectedBrowseOption == categories) _buildCategorySection(),
              if (selectedBrowseOption == budget) _buildBudgetSection(),
              if (selectedBrowseOption == brand) _buildBrandSection(),
              if (selectedBrowseOption == model) _buildModelSection(),
              if (selectedBrowseOption == cities) _buildCitiesSection(),
              SizedBox(height: 60),
              Row(
                children: [
                  Icon(Icons.verified, color: whiteColor),
                  SizedBox(width: 10),
                  ReusableText(certifiedCars,
                      fontSize: 18, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Hilux Revo V',
                              imagePaths: [
                                'assets/ad_images/ad3/ad3-1.webp',
                                'assets/ad_images/ad3/ad3-2.webp',
                                'assets/ad_images/ad3/ad3-3.webp',
                              ],
                              price: 'PKR 2,000,000',
                              city: 'Karachi',
                              year: '2018',
                              kms: '50,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Karachi',
                              exteriorColor: 'White',
                              assembly: 'Local',
                              engineCapacity: '2400 cc',
                              bodyType: 'Pickup',
                              adId: '123456',
                              sellerComments: [
                                '2nd owner',
                                'Document available',
                                '3 keys available',
                              ],
                              sellerName: 'John Doe',
                              memberSince: 'Jan 2020',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad3/ad3-1.webp',
                        carName: 'Toyota Hilux Revo V',
                        price: 'PKR 2,000,000',
                        city: 'Karachi',
                        details: '2018 | 50,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Peugeot 2008',
                              imagePaths: [
                                'assets/ad_images/ad2/ad2-1.webp',
                                'assets/ad_images/ad2/ad2-2.webp',
                                'assets/ad_images/ad2/ad2-3.webp',
                              ],
                              price: 'PKR 2,500,000',
                              city: 'Lahore',
                              year: '2019',
                              kms: '30,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Lahore',
                              exteriorColor: 'Red',
                              assembly: 'Imported',
                              engineCapacity: '1600 cc',
                              bodyType: 'SUV',
                              adId: '654321',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Jane Doe',
                              memberSince: 'Feb 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad2/ad2-1.webp',
                        carName: 'Peugeot 2008',
                        price: 'PKR 2,500,000',
                        city: 'Lahore',
                        details: '2019 | 30,000 km | Petrol',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Hyundai Elantra',
                              imagePaths: [
                                'assets/ad_images/ad1/ad1-1.webp',
                                'assets/ad_images/ad1/ad1-2.webp',
                                'assets/ad_images/ad1/ad1-3.webp',
                              ],
                              price: 'PKR 1,200,000',
                              city: 'Islamabad',
                              year: '2020',
                              kms: '20,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Islamabad',
                              exteriorColor: 'Blue',
                              assembly: 'Local',
                              engineCapacity: '2000 cc',
                              bodyType: 'Sedan',
                              adId: '789012',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Alice Smith',
                              memberSince: 'Mar 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad1/ad1-1.webp',
                        carName: 'Hyundai Elantra',
                        price: 'PKR 1,200,000',
                        city: 'Islamabad',
                        details: '2020 | 20,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Passo X L Package',
                              imagePaths: [
                                'assets/ad_images/ad10/ad10-1.webp',
                                'assets/ad_images/ad10/ad10-2.webp',
                                'assets/ad_images/ad10/ad10-3.webp',
                              ],
                              price: 'PKR 1,200,000',
                              city: 'Islamabad',
                              year: '2020',
                              kms: '20,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Islamabad',
                              exteriorColor: 'Silver',
                              assembly: 'Imported',
                              engineCapacity: '1000 cc',
                              bodyType: 'Hatchback',
                              adId: '345678',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Bob Johnson',
                              memberSince: 'Apr 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad10/ad10-1.webp',
                        carName: 'Toyota Passo X L Package',
                        price: 'PKR 1,200,000',
                        city: 'Islamabad',
                        details: '2020 | 20,000 km | Petrol',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Icon(Icons.flag, color: whiteColor),
                  SizedBox(width: 10),
                  ReusableText(japaneseCars,
                      fontSize: 18, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Yaris HatchBack',
                              imagePaths: [
                                'assets/ad_images/ad6/ad6-1.webp',
                                'assets/ad_images/ad6/ad6-2.webp',
                                'assets/ad_images/ad6/ad6-3.webp',
                              ],
                              price: 'PKR 2,000,000',
                              city: 'Karachi',
                              year: '2018',
                              kms: '50,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Karachi',
                              exteriorColor: 'White',
                              assembly: 'Local',
                              engineCapacity: '1500 cc',
                              bodyType: 'Hatchback',
                              adId: '901234',
                              sellerComments: [
                                '2nd owner',
                                'Document available',
                                '3 keys available',
                              ],
                              sellerName: 'Hassan Iftikhar',
                              memberSince: 'May 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad6/ad6-1.webp',
                        carName: 'Toyota Yaris HatchBack',
                        price: 'PKR 2,000,000',
                        city: 'Karachi',
                        details: '2018 | 50,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Aqua S',
                              imagePaths: [
                                'assets/ad_images/ad11/ad11-1.webp',
                                'assets/ad_images/ad11/ad11-2.webp',
                                'assets/ad_images/ad11/ad11-3.webp',
                              ],
                              price: 'PKR 2,500,000',
                              city: 'Lahore',
                              year: '2019',
                              kms: '30,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Lahore',
                              exteriorColor: 'Blue',
                              assembly: 'Imported',
                              engineCapacity: '1500 cc',
                              bodyType: 'Hatchback',
                              adId: '567890',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'David Green',
                              memberSince: 'Jun 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad11/ad11-1.webp',
                        carName: 'Toyota Aqua S',
                        price: 'PKR 2,500,000',
                        city: 'Lahore',
                        details: '2019 | 30,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Raize Z',
                              imagePaths: [
                                'assets/ad_images/ad7/ad7-1.webp',
                                'assets/ad_images/ad7/ad7-2.webp',
                                'assets/ad_images/ad7/ad7-3.webp',
                              ],
                              price: 'PKR 1,200,000',
                              city: 'Islamabad',
                              year: '2020',
                              kms: '20,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Islamabad',
                              exteriorColor: 'Red',
                              assembly: 'Imported',
                              engineCapacity: '1000 cc',
                              bodyType: 'SUV',
                              adId: '234567',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Eve White',
                              memberSince: 'Jul 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad7/ad7-1.webp',
                        carName: 'Toyota Raize Z',
                        price: 'PKR 1,200,000',
                        city: 'Islamabad',
                        details: '2020 | 20,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Honda Vezel Z',
                              imagePaths: [
                                'assets/ad_images/ad9/ad9-1.webp',
                                'assets/ad_images/ad9/ad9-2.webp',
                                'assets/ad_images/ad9/ad9-3.webp',
                              ],
                              price: 'PKR 1,200,000',
                              city: 'Islamabad',
                              year: '2020',
                              kms: '20,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Islamabad',
                              exteriorColor: 'Black',
                              assembly: 'Imported',
                              engineCapacity: '1500 cc',
                              bodyType: 'SUV',
                              adId: '890123',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Frank Black',
                              memberSince: 'Aug 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad9/ad9-1.webp',
                        carName: 'Honda Vezel Z',
                        price: 'PKR 1,200,000',
                        city: 'Islamabad',
                        details: '2020 | 20,000 km | Petrol',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Toyota Passo X L Package',
                              imagePaths: [
                                'assets/ad_images/ad10/ad10-1.webp',
                                'assets/ad_images/ad10/ad10-2.webp',
                                'assets/ad_images/ad10/ad10-3.webp',
                              ],
                              price: 'PKR 1,200,000',
                              city: 'Islamabad',
                              year: '2020',
                              kms: '20,000 km',
                              fuelType: 'Petrol',
                              gearType: 'Automatic',
                              registeredIn: 'Islamabad',
                              exteriorColor: 'Silver',
                              assembly: 'Imported',
                              engineCapacity: '1000 cc',
                              bodyType: 'Hatchback',
                              adId: '345678',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'Bob Johnson',
                              memberSince: 'Apr 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad10/ad10-1.webp',
                        carName: 'Toyota Passo X L Package',
                        price: 'PKR 1,200,000',
                        city: 'Islamabad',
                        details: '2020 | 20,000 km | Petrol',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Icon(Icons.electric_car, color: whiteColor),
                  SizedBox(width: 10),
                  ReusableText(electricCars,
                      fontSize: 18, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Deepal L07 EV',
                              imagePaths: [
                                'assets/ad_images/ad12/ad12-1.webp',
                                'assets/ad_images/ad12/ad12-2.webp',
                                'assets/ad_images/ad12/ad12-3.webp',
                              ],
                              price: 'PKR 2,000,000',
                              city: 'Karachi',
                              year: '2018',
                              kms: '50,000 km',
                              fuelType: 'Electric',
                              gearType: 'Automatic',
                              registeredIn: 'Karachi',
                              exteriorColor: 'White',
                              assembly: 'Local',
                              engineCapacity: '1500 cc',
                              bodyType: 'Hatchback',
                              adId: '901234',
                              sellerComments: [
                                '2nd owner',
                                'Document available',
                                '3 keys available',
                              ],
                              sellerName: 'Charlie Brown',
                              memberSince: 'May 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad12/ad12-1.webp',
                        carName: 'Deepal L07 EV',
                        price: 'PKR 2,000,000',
                        city: 'Karachi',
                        details: '2018 | 50,000 km | Electric',
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdDetailsPage(
                              carName: 'Porsche Taycan Base Model',
                              imagePaths: [
                                'assets/ad_images/ad13/ad13-1.webp',
                                'assets/ad_images/ad13/ad13-2.webp',
                                'assets/ad_images/ad13/ad13-3.webp',
                              ],
                              price: 'PKR 2,500,000',
                              city: 'Lahore',
                              year: '2019',
                              kms: '30,000 km',
                              fuelType: 'Electric',
                              gearType: 'Automatic',
                              registeredIn: 'Lahore',
                              exteriorColor: 'Blue',
                              assembly: 'Imported',
                              engineCapacity: '1500 cc',
                              bodyType: 'Hatchback',
                              adId: '567890',
                              sellerComments: [
                                '1st owner',
                                'Document available',
                                '2 keys available',
                              ],
                              sellerName: 'David Green',
                              memberSince: 'Jun 2021',
                            ),
                          ),
                        );
                      },
                      child: AdCard(
                        imagePath: 'assets/ad_images/ad13/ad13-1.webp',
                        carName: 'Porsche Taycan Base Model',
                        price: 'PKR 2,500,000',
                        city: 'Lahore',
                        details: '2019 | 30,000 km | Electric',
                      ),
                    ),
                    SizedBox(width: 10),
                    AdCard(
                      imagePath: 'assets/ad_images/ad14/ad14-1.webp',
                      carName: 'Tesla Model 3',
                      price: 'PKR 1,200,000',
                      city: 'Islamabad',
                      details: '2020 | 20,000 km | Electric',
                    ),
                    SizedBox(width: 10),
                    AdCard(
                      imagePath: 'assets/ad_images/ad15/ad15-1.webp',
                      carName: 'Audi E-Tron GT',
                      price: 'PKR 1,200,000',
                      city: 'Islamabad',
                      details: '2020 | 20,000 km | Electric',
                    ),
                    SizedBox(width: 10),
                    AdCard(
                      imagePath: 'assets/ad_images/ad16/ad16-1.webp',
                      carName: 'Mercedes Benz EQC 400 ',
                      price: 'PKR 1,200,000',
                      city: 'Islamabad',
                      details: '2020 | 20,000 km | Electric',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Icon(Icons.local_gas_station, color: whiteColor),
                  SizedBox(width: 10),
                  ReusableText('Current Fuel Prices',
                      fontSize: 18, fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 15),
              FuelPriceCard(
                fuelPrices: {
                  'Petrol (Super)': 'PKR 256.13',
                  'High Speed Diesel': 'PKR 260.95',
                  'Light Speed Diesel': 'PKR 148.95',
                  'Kerosene Oil': 'PKR 161.66',
                  'CNG Region-I': 'PKR 1900',
                  'CNG Region-II': 'PKR 1900',
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(iconData: Icons.directions_car, text: 'Sedan'),
            CategoryCard(iconData: Icons.local_car_wash, text: 'SUV'),
            CategoryCard(iconData: Icons.electric_car, text: 'Electric'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(iconData: Icons.family_restroom, text: 'Family Car'),
            CategoryCard(iconData: Icons.fire_truck, text: 'Truck'),
            CategoryCard(iconData: Icons.settings, text: 'Automatic'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(iconData: Icons.directions_car_filled, text: 'Luxury'),
            CategoryCard(iconData: Icons.car_repair, text: 'Convertible'),
            CategoryCard(iconData: Icons.car_rental, text: 'Hatchback'),
          ],
        ),
      ],
    );
  }

  Widget _buildBudgetSection() {
    return TextListSection(
      items: [
        'under 5 lakh',
        '5-20 lakh',
        '20-35 lakh',
        '35-50 lakh',
        '50-65 lakh',
        '65-80 lakh',
        '80 lakh - 1 crore',
        '1 crore and above',
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BrandCard(imagePath: 'assets/suzuki.png', text: 'Suzuki'),
            BrandCard(imagePath: 'assets/toyota.png', text: 'Toyota'),
            BrandCard(imagePath: 'assets/honda.png', text: 'Honda'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BrandCard(imagePath: 'assets/daihatsu.png', text: 'Daihatsu'),
            BrandCard(imagePath: 'assets/nissan.png', text: 'Nissan'),
            BrandCard(imagePath: 'assets/hyundai.png', text: 'Hyundai'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BrandCard(imagePath: 'assets/kia.png', text: 'Kia'),
            BrandCard(imagePath: 'assets/mitsubishi.png', text: 'Mitsubishi'),
            BrandCard(imagePath: 'assets/mercedes.png', text: 'Mercedes'),
          ],
        ),
      ],
    );
  }

  Widget _buildModelSection() {
    return TextListSection(
      items: [
        'Corolla',
        'Civic',
        'Mehran',
        'City',
        'Alto',
        'Cultus',
        'Wagon R',
        'Vitz',
        'Bolan',
        'Mira',
      ],
    );
  }

  Widget _buildCitiesSection() {
    return TextListSection(
      items: [
        'Karachi',
        'Lahore',
        'Islamabad',
        'Rawalpindi',
        'Faisalabad',
        'Peshawar',
        'Multan',
        'Gujranwala',
      ],
    );
  }

  Widget _buildOptionButton(String option) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedOption = option;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: selectedOption == option
            ? whiteColor
            : unselectedOptionBackgroundColor,
      ),
      child: ReusableText(
        option,
        style: TextStyle(
          color: topBarTextColor,
        ),
      ),
    );
  }

  Widget _buildBrowseOptionButton(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBrowseOption = option;
        });
      },
      child: Column(
        children: [
          ReusableText(
            option,
            style: TextStyle(
              color: selectedBrowseOption == option ? blueColor : whiteColor,
            ),
          ),
          if (selectedBrowseOption == option)
            Container(
              margin: EdgeInsets.only(top: 2),
              height: 2,
              width: 90,
              color: blueColor,
            ),
        ],
      ),
    );
  }
}
