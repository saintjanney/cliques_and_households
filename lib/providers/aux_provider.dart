import 'package:flutter/material.dart';

class AuxProvider with ChangeNotifier {
  String? userID;

  void setUserID(String id) {
    userID = id;
    notifyListeners();
  }
}
