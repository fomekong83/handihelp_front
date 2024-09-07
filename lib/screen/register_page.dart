import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../animations/delayed_animation.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 1500,
                    child: Text(
                      "Create an account",
                      style: GoogleFonts.poppins(
                        color: Colors.red, // d_red should be replaced with Colors.red if not defined
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  DelayedAnimation(
                    delay: 2500,
                    child: Text(
                      "It is important to register to better protect your data.",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            RegisterForm(),
            SizedBox(height: 125),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.red, // d_red should be replaced with Colors.red if not defined
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRM',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(), // Ensure MyApp is defined in your project
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            DelayedAnimation(
              delay: 6000,
              child: Text(
                "Or continue with",
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedAnimation(
                  delay: 6500,
                  child: GestureDetector(
                    onTap: () {
                      // Handle Google sign-in
                    },
                    child: Image.asset(
                      'assets/images/google.png', // Add Google logo image asset
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                DelayedAnimation(
                  delay: 6500,
                  child: GestureDetector(
                    onTap: () {
                      // Handle Facebook sign-in
                    },
                    child: Image.asset(
                      'assets/images/facebook.png', // Add Facebook logo image asset
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 7000,
                    child: Text(
                      "SKIP",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _obscureText = true;
  var _confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 3500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          DelayedAnimation(
            delay: 4000,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          DelayedAnimation(
            delay: 4500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                hintText: 'YYYY-MM-DD',
              ),
            ),
          ),
          SizedBox(height: 15),
          DelayedAnimation(
            delay: 5000,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          DelayedAnimation(
            delay: 5500,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          DelayedAnimation(
            delay: 6000,
            child: TextField(
              obscureText: _confirmObscureText,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmObscureText = !_confirmObscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
