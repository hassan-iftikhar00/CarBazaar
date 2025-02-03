import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../widgets/ad_card.dart';

class AdDetailsPage extends StatelessWidget {
  final String carName;
  final List<String> imagePaths;
  final String price;
  final String city;
  final String year;
  final String kms;
  final String fuelType;
  final String gearType;
  final String registeredIn;
  final String exteriorColor;
  final String assembly;
  final String engineCapacity;
  final String bodyType;
  final String adId;
  final List<String> sellerComments;
  final String sellerName;
  final String memberSince;

  const AdDetailsPage({
    super.key,
    required this.carName,
    required this.imagePaths,
    required this.price,
    required this.city,
    required this.year,
    required this.kms,
    required this.fuelType,
    required this.gearType,
    required this.registeredIn,
    required this.exteriorColor,
    required this.assembly,
    required this.engineCapacity,
    required this.bodyType,
    required this.adId,
    required this.sellerComments,
    required this.sellerName,
    required this.memberSince,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: whiteColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: whiteColor),
            onPressed: () {},
          ),
        ],
        title: Text(
          carName,
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 280,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: imagePaths.length,
                          itemBuilder: (context, index) => Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "${imagePaths.length} Photos",
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  price,
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  carName,
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    year,
                                    style: TextStyle(
                                      color: blueColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Year",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildInfoChip(Icons.location_on, city),
                            _buildInfoChip(Icons.speed, kms),
                            _buildInfoChip(Icons.local_gas_station, fuelType),
                            _buildInfoChip(Icons.settings, gearType),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: "Vehicle Details",
                    content: Column(
                      children: [
                        _buildDetailRow("Registered In", registeredIn),
                        _buildDetailRow("Exterior Color", exteriorColor),
                        _buildDetailRow("Assembly", assembly),
                        _buildDetailRow("Engine Capacity", engineCapacity),
                        _buildDetailRow("Body Type", bodyType),
                        _buildDetailRow("Ad ID", adId),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: "Seller Comments",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sellerComments
                          .map((comment) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.comment,
                                        color: blueColor, size: 20),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        comment,
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  _buildSection(
                    title: "Features",
                    content: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      children: [
                        _buildFeatureItem("Air Conditioning", Icons.ac_unit),
                        _buildFeatureItem("Bluetooth", Icons.bluetooth),
                        _buildFeatureItem("Rear Camera", Icons.camera),
                        _buildFeatureItem("Navigation", Icons.gps_fixed),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: "Seller Information",
                    content: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sellerName,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Member since $memberSince",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.message, color: blueColor),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ads You May Like",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 270,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            separatorBuilder: (_, __) => SizedBox(width: 12),
                            itemBuilder: (context, index) => AdCard(
                              imagePath:
                                  'assets/ad_images/ad${index + 6}/ad${index + 6}-1.webp',
                              carName: 'Toyota Model ${index + 1}',
                              price: 'PKR ${1.5 + index * 0.5}M',
                              city: [
                                'Karachi',
                                'Lahore',
                                'Islamabad'
                              ][index % 3],
                              details:
                                  '202${index % 3} | ${index * 10}000 km | Petrol',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.call,
                      size: 20,
                      color: whiteColor,
                    ),
                    label: Text("Call Seller"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      foregroundColor: whiteColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.chat, size: 20, color: blueColor),
                    label: Text("Chat"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: blueColor,
                      side: BorderSide(color: blueColor),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(12),
            ),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: blueColor, size: 18),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: whiteColor),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: blueColor, size: 20),
        SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(color: whiteColor),
        ),
      ],
    );
  }
}
