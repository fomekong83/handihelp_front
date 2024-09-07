import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handihelp/animations/delayed_animation.dart';
import 'package:handihelp/main.dart';
import 'package:handihelp/services/app_colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 15,
                child: Container(
                  height: 170,
                  child: Image.asset('assets/images/yoga_3.png'),
                ),
              ),
              DelayedAnimation(
                delay: 25,
                child: Container(
                  height: 400,
                  child: Image.asset('assets/images/yoga_2.jpeg',fit: BoxFit.contain,),
                ),
              ),
              DelayedAnimation(
                delay: 25,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Get fitter, stronger, and embrasse a helthier lifestyle",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 45,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.d_red,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13)),
                    child: Text('GET STARTED'),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/social");
                    },
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




