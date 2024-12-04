import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GorupService with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createGroup() async {
    try {
      await _firestore.collection('groups').add({
        'name': 'Clique',
        'members': [],
      });
    } catch (e) {
      print(e);
    }
  }
}
