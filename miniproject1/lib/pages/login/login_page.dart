import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniproject1/pages/cart/resources/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 150), // Added space at the top
            Text(
              'Hello Again!',
              style: GoogleFonts.raleway(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8), // Adjusted spacing
            Text(
              'Fill Your Details Or Continue With \nSocial Media',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF707B81),
                
              ),
            ),
            SizedBox(height: 48), // Adjusted spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    color: Color(0xFF6A6A6A),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Add your password recovery logic here
                      // Fluttertoast.showToast(
                      //   msg: "Recovery Password clicked",
                      //   toastLength: Toast.LENGTH_SHORT,
                      //   gravity: ToastGravity.BOTTOM,
                      // );
                    },
                    child: Text(
                      'Recovery Password',
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF707B81),
                      ),
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
                  context.push('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  fixedSize: Size(335, 50),
                  minimumSize: Size(double.infinity, 45),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign In',
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
                  fixedSize: Size(335, 50),
                  backgroundColor: Color(0xFFF7F7F9),
                  minimumSize: Size(double.infinity, 45),
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
                      'Sign In with Google',
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
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
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
                    context.push('/register');
                  },
                  child: Text(
                    'Create Account',
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
