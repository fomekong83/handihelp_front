import 'dart:math';

import 'package:flutter/material.dart';
import 'package:handihelp/services/sharedPreferences.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class GeneralServices {
  /*static bool formValidator({required var formkey}){
    return formkey.currentState!.validate();
  }*/

  static String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static RegExp regExp = RegExp(emailPattern);

  static bool isEmailValid(String email) {
    return regExp.hasMatch(email);
  }


  static void displaySnackBar(BuildContext context, String message, {Color color = Colors.white}) {

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        /*snackBarAnimationStyle: AnimationStyle(
            duration: Duration(seconds: 2),
            curve: Curves.bounceIn,
            reverseCurve: Curves.easeInOut,
            reverseDuration: Duration(seconds: 2)
        ),*/
        SnackBar(
          //padding: EdgeInsets.all(15),
          //margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: color.withOpacity(1),
          width: MediaQuery.of(context).size.width >= desktopBreakPoint ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.7,
          elevation: 0,
          content: Text(message, textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
          dismissDirection: DismissDirection.down,
        ),
    );
  }


  static Future<TimeOfDay?> displayTimePicker(BuildContext context) async {
    return await showTimePicker(
      context: context,
      helpText: "Enter Time in 12h format",
      initialTime: TimeOfDay(hour: 06, minute: 00),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );
  }


  static bool isOwner(BuildContext context, String id1) {
    if (!context.read<AppSharedPreferences>().getLoginStatus) return false;
    if (id1.toLowerCase().compareTo(
            context.read<AppSharedPreferences>().user!.id_user.toLowerCase()) ==
        0) return true;
    return false;
  }

  static String pluralChecker(int value) {
    return value > 1 ? "s" : "";
  }

  static String spacer(String value) {
    String result;
    result = value.isEmpty ? "" : " | ";
    return result;
  }

  static MyTextScaleFactor(BuildContext context,
      {double minTextFactor = 0.8, double maxTextFactor = 1.5}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextFactor;
    return max(minTextFactor, min(val, maxTextFactor));
  }

}
