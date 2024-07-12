import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniproject1/pages/cart/resources/colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 30), // Added space at the top
            Text(
              'Register Account',
              style: GoogleFonts.raleway(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8), // Adjusted spacing
            Text(
              'Fill Your Details Or Continue With \nSocial Media',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF707B81),
              ),
            ),
            SizedBox(height: 48), // Adjusted spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Name',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF7F7F9),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Email Address',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF7F7F9),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Password',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF7F7F9),
                    contentPadding: EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF6A6A6A),
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24), // Adjusted spacing
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  // You can add your registration logic here
                  Fluttertoast.showToast(
                    msg: "Register button pressed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(double.infinity, 45),
                  fixedSize: Size(335, 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  // Fluttertoast.showToast(
                  //   msg: "Sign Up with Google button pressed",
                  //   toastLength: Toast.LENGTH_SHORT,
                  //   gravity: ToastGravity.BOTTOM,
                  // );

                  // To login page
                  // context.push('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF7F7F9),
                  minimumSize: Size(double.infinity, 45),
                  fixedSize: Size(335, 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Sign Up with Google',
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24), // Adjusted spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF707B81),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/login');
                  },
                  child: Text(
                    'Log in',
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
