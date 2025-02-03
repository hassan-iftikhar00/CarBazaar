import 'package:flutter/material.dart';
import 'package:project/widgets/text_widget.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class SellNowPage extends StatelessWidget {
  const SellNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: ReusableText(
          sellNowPageHeading,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader('Car Details'),
              _buildTextField('Car Make', Icons.directions_car),
              SizedBox(height: 10),
              _buildTextField('Car Model', Icons.model_training),
              SizedBox(height: 10),
              _buildTextField('Year', Icons.calendar_today),
              SizedBox(height: 10),
              _buildTextField('Price', Icons.attach_money),
              SizedBox(height: 10),
              _buildTextField('Mileage', Icons.speed),
              SizedBox(height: 10),
              _buildTextField('City', Icons.location_city),
              SizedBox(height: 10),
              _buildTextField('Description', Icons.description, maxLines: 5),
              SizedBox(height: 20),
              _buildHeader('Seller Contact Info'),
              _buildTextField('Name', Icons.person),
              SizedBox(height: 10),
              _buildTextField('Mobile Number', Icons.phone),
              SizedBox(height: 10),
              _buildToggle('Allow WhatsApp Contact'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send, color: whiteColor),
                  label: ReusableText(
                    postAdText,
                    style: TextStyle(color: whiteColor, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  sellNowWarning,
                  style: TextStyle(color: lightBlue, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(Icons.directions_car, color: blueColor),
          SizedBox(width: 10),
          ReusableText(
            text,
            style: TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: whiteColor),
        prefixIcon: Icon(icon, color: whiteColor),
        filled: true,
        fillColor: cardBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: TextStyle(color: whiteColor),
    );
  }

  Widget _buildToggle(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          label,
          style: TextStyle(color: whiteColor, fontSize: 16),
        ),
        Switch(
          value: true,
          onChanged: (bool value) {},
          activeColor: blueColor,
        ),
      ],
    );
  }
}
