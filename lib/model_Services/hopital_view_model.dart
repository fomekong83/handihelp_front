import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handihelp/models/hopital.dart';
import 'package:handihelp/services/CallApi.dart';
import 'package:handihelp/services/general_services.dart';
import 'package:handihelp/services/sharedPreferences.dart';
import 'package:provider/provider.dart';


class HopitalViewModel extends ChangeNotifier{
  bool isregistring = false,updatingHopital = false;
  bool isAssociating = false;
  bool loadingHopital = false;
  bool loadingPersonel = false;
  bool is_deleting = false;
  String _error = '';

  List<Hopital> hopitaux = [];

  Future<bool> getLevels({required String id_school})async{
    if(loadingHopital) return false;
    loadingHopital = true;
    //houses.clear();
    notifyListeners();
    try{
      print('comment above');
      final response = await CallApi().unAuthGetData("house/${id_school}");

      print('comment below');
      //print(response.body);
      //print(response.headers);
      if(response.statusCode == 200){
        print("inside");
        Iterable list = jsonDecode(response.body)["data"];
        print(list);
        List<Hopital> newItems = [];
        newItems.addAll(List<Hopital>.from(list.map((e) => Hopital.fromJson(e))));

        loadingHopital = false;
        notifyListeners();
        return true;
      }else{
        print(response.headers);
        print(response.body);
        print(response.statusCode);
        loadingHopital = false;
        notifyListeners();
        return false;
      }
    }catch(e){
      print(e.toString()+'gfhgfhgfhg');
      loadingHopital = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerHopital(BuildContext context,var data) async {
    if(isregistring) return false;
    isregistring = true;
    notifyListeners();

    try {
      final response = await CallApi().unAuthPostData(data,"ajouter/hopitals");

      print(response.body);
      if(response.statusCode == 200){
        GeneralServices.displaySnackBar(context,jsonDecode(response.body)["message"],color: Colors.green);
        Hopital hopital = Hopital.fromJson(jsonDecode(response.body)["hopital"]);

        hopitaux.add(hopital);

        isregistring = false;
        notifyListeners();
        return jsonDecode(response.body)["success"];
      }else{
        isregistring = false;
        notifyListeners();
        GeneralServices.displaySnackBar(context,jsonDecode(response.body)["message"],color: Colors.red);
        return false;
      }

    }on TimeoutException catch(_){
      isregistring = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }on SocketException catch(_){
      print('no internet');
      isregistring = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }catch(e){
      print(e);
      isregistring = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }
  }

  Future<bool> updateLevel(BuildContext context,var data) async {
    if(updatingHopital) return false;
    updatingHopital = true;
    notifyListeners();

    try {
      final response = await CallApi().authPutData(data,"v1/level/");

      print(response.body);
      if(response.statusCode == 200){
        GeneralServices.displaySnackBar(context,jsonDecode(response.body)["message"],color: Colors.green);
        String level_name = jsonDecode(response.body)["level_name"];
        //context.read<AppSharedPreferences>().updateLevel(data["id_level"],level_name);

        updatingHopital = false;
        notifyListeners();
        return jsonDecode(response.body)["success"];
      }else{
        updatingHopital = false;
        notifyListeners();
        GeneralServices.displaySnackBar(context,jsonDecode(response.body)["message"],color: Colors.red);
        return false;
      }

    }on TimeoutException catch(_){
      updatingHopital = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }on SocketException catch(_){
      print('no internet');
      updatingHopital = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }catch(e){
      print(e);
      updatingHopital = false;
      notifyListeners();
      GeneralServices.displaySnackBar(context,"Error occured",color: Colors.red);
      return false;
    }
  }

  /*Future<void> deleteSpecialiteMedecin(int id_hopital) async {
    is_deleting = true;
    notifyListeners();

    try {
      final response = await http.delete(
        Uri.parse('YOUR_API_ENDPOINT/$id_hopital'),
      );

      if (response.statusCode == 204) {
        hopitaux.removeWhere((sm) =>
        sm.id_hopital == id_hopital
        );
      } else {
        _error = 'Failed to delete specialite medecin';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      is_deleting = false;
      notifyListeners();
    }
  }*/

}