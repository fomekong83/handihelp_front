import 'package:flutter/material.dart';

class SuperAdminMenuProvider extends ChangeNotifier {
  int menu = -1;

  void changerMenu(int men) {
    menu = men;
    notifyListeners();
  }
}