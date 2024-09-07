import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';



class AppSharedPreferences extends ChangeNotifier{

  bool _isLoggedIn = false;
  int _userPower = 0;
  bool _isProfileSet = false;
  String? token;
  User? user = new User(id_user: '', id_centre: '', name: '', phone: 0, status: false, verified_at: '');

  int get getPower => _userPower;
  bool get getLoginStatus => _isLoggedIn;
  void setIsLogIn(bool newVal){
    _isLoggedIn = newVal;
    notifyListeners();
  }
  bool get getProfileStatus => _isProfileSet;
  void setProfilStatus(bool newVal){
    _isProfileSet = newVal;
    notifyListeners();
  }



  Future<bool> getFirstTime()async{
    bool firstlog = true;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //var firstT  = localStorage.setBool("firstTime",true);
    //print("THE FIRST LOG BEFORE 1 IS $isFirstLog");

    //isFirstLog = localStorage.getBool("firstTime"); //true means it is the first time user Log
    firstlog = localStorage.getBool("firstTime") ?? true; //true means it is the first time user Log
    return firstlog;
    //print("THE FIRST LOG AFTER IS $isFirstLog");
  }
  void setFirstTime()async{
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setBool("firstTime",false);
  }

  void getSettingsPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
  }

  void setSettingsPreferences() async {

  }

  void getLoggingPreferences() async {

  }

  void resetApplication()async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //clear token
    localStorage.remove("token");
    //clear user
    localStorage.remove("user");
  }



  Future<bool> setLoggingPreferences(var body,String token)async{
    //print('THE DATA BODY IN PREFERENCES IS ${body}');
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await clearUserPreferences();
    try{
      //register Token and to SharedPreferences
      localStorage.setString("token", token);
      localStorage.setString("user", jsonEncode(body));

      print('DONE RECORDING');
      await checkIfLogIn();
      print('DONE LOADING');
      print('preferences were stored');
      return true;
    }catch(e){
      print(e);
      _isLoggedIn = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> checkIfLogIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try{
      print('HELLLLLLOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
      //check if token is there
      token  = localStorage.getString("token");
      print('THE TOKEN WE HAVE IS $token');
      //print('THE USER TOKEN IS ${tokenPref}');
      if(token != null){
        //var user = jsonDecode(localStorage.getString("user")?? "Not Logged");
        print("YYYYYYYYYYYYYYYY");
        print(localStorage.getString("user"));
        user = User.fromJson(jsonDecode(localStorage.getString("user") ?? "Not Logged"));
        print("PPPPPPPPPPPPPPPPP");
        //print(jsonDecode(localStorage.getString("user"));
        print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
        print(user!.phone);
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }else{
        _isLoggedIn = false;
        notifyListeners();
        return false;
      }
    }catch(e){
      await clearUserPreferences();
      _isLoggedIn = false;
      notifyListeners();
      return false;
    }
  }


  Future<bool> clearUserPreferences()async{
    bool result = false;
    print("in clear user references");
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try{
      //clear token
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(token);
      print(_isLoggedIn);
      print("tttttttttttttttttttttttttttttttttttttttttttttttt");
      localStorage.remove("token");
      //clear user
      localStorage.remove("user");
      print("finish clearing user data and references");
      token = '';
      result = true;
      _isLoggedIn = false;
      notifyListeners();
    }catch(e){
      print(e.toString());
      result = false;
    }
    return result;
    //});
  }



}