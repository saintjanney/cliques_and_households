import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuxProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? userID;

  void setUserID(String id) {
    userID = id;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getBalance(String userID) {
    return _firestore
        .collection('users')
        .where("userId", isEqualTo: userID)
        .snapshots();
  }
}
