import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';


//MY BREAKPOINTS ARE
int mobileBreakPoint = 481;
int tabletteBreakPoint = 481;
int desktopBreakPoint = 769;

//ADVANCE DESKTOP BREAKPOINTS
int minDesktopBreakPoint = 1300;
int mediunDeskTopBreakPoint = 1300;
int maxDeskTopBreakPoint = 1600;

class ActualPlatform {
  static late bool isAndroid;
  static late bool isIOS;
  //bool? isWeb;
  void init(BuildContext context){
    isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    isAndroid = Theme.of(context).platform == TargetPlatform.android;
  }

  //RETURN 1 FOR ANDROID, 2 FOR IOS AND 3 FOR WEB
  static int platform(){
    try{
      if(Platform.isAndroid) return 1;
      if(Platform.isIOS) return 2;
    }catch(e){
      if(kIsWeb) return 3;
    }
    return 0;
  }
}


var WEEKDAYS = {1: "Monday",2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Satuday", 7: "Sunday" };

Color iconColor = Colors.indigo;
Color btnColor = Colors.indigo;
Color appColor = Colors.indigo;


TextStyle textStyleLevel1 = TextStyle(fontWeight: FontWeight.bold,fontSize: 30);
TextStyle textStyleLevel2 = TextStyle(fontWeight: FontWeight.bold,fontSize: 25);
TextStyle textStyleLevel3 = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);

double inputHeight = 35;

InputDecoration inputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 1.0),
  ),
);
