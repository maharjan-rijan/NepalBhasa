import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nepal_bhasa/screens/home.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SVG logo
              SvgPicture.asset('assets/svgicons/logo.svg', height: 500),
              SizedBox(height: 15),
              Text(
                'रञ्जना लिपि',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300],
                  fontFamily: 'Peeti', // or any Nepali font if needed
                ),
              ),
              SizedBox(height: 15),

              // Google login button with SVG
              ElevatedButton.icon(
                onPressed: () => _handleGoogleSignIn(context),
                icon: SvgPicture.asset(
                  'assets/svgicons/google.svg',
                  height: 24,
                  width: 24,
                ),
                label: Text('Login with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
