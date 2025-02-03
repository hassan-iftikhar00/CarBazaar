import 'package:flutter/material.dart';
import 'package:project/bottomNavBar/bottomNavBar.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/auth_provider.dart';
import '../services/auth_service.dart';
import '../utils/colors.dart';
import 'signup.dart';
import 'home.dart';
import 'login_prompt.dart';
import 'more.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  final bool fromMorePage;
  final int? redirectIndex;

  const LoginPage({super.key, required this.fromMorePage, this.redirectIndex});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authService.login(
        _emailController.text,
        _passwordController.text,
      );
      print('Login successful: $response');
      if (!mounted) return;

      final Map<String, dynamic> responseData = response;
      final String username = responseData['name'];
      final String token = responseData['token'];

      Provider.of<AuthProvider>(context, listen: false).login(username);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
          (Route<dynamic> route) => false,
        );
      });
    } catch (e) {
      print('Login failed: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to login')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            if (widget.fromMorePage) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(
                          username: '',
                          isLoggedIn: false,
                        )),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPromptPage(
                        redirectIndex: widget.redirectIndex ?? 0)),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/illustrations/authentication.png',
                  height: 200),
              SizedBox(height: 30),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please login to your account',
                style: TextStyle(
                  color: lightBlue,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 30),
              _buildTextField('Email', Icons.email, _emailController),
              SizedBox(height: 20),
              _buildTextField('Password', Icons.lock, _passwordController,
                  obscureText: true),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: whiteColor, fontSize: 16.0),
                      ),
                    ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupPage(fromMorePage: false)),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: lightBlue, fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: whiteColor),
        prefixIcon: Icon(icon, color: whiteColor),
        filled: true,
        fillColor: cardBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blueColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: TextStyle(color: whiteColor),
    );
  }
}
