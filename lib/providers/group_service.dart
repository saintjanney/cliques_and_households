import 'package:cliques_and_households/models/group_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class GroupService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new group
  Future<void> createGroup(Group group) async {
    try {
      await _firestore.collection('groups').doc(group.groupId).set(group.toJson());
      print("Group created successfully!");
    } catch (e) {
      print("Error creating group: $e");
    }
  }



  Future<List<Group>> getGroups() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('groups').get();
      return snapshot.docs.map((doc) => Group.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching groups: $e");
      return [];
    }
  }


  Future<Group?> getGroup(String groupId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('groups').doc(groupId).get();
      if (doc.exists) {
        return Group.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print("Group not found");
        return null;
      }
    } catch (e) {
      print("Error fetching group: $e");
      return null;
    }
  }

    Future<void> deleteGroup(String groupId) async {
    try {
      await _firestore.collection('groups').doc(groupId).delete();
      print("Group deleted successfully!");
    } catch (e) {
      print("Error deleting group: $e");
    }
  }

}