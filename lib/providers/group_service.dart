import 'package:cliques_and_households/models/group_model.dart';
import 'package:cliques_and_households/models/users.dart';
import 'package:cliques_and_households/models/group_transactions.dart' as t;
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new group
  Future<void> createGroup(Group group) async {
    try {
      await _firestore
          .collection('groups')
          .doc(group.groupId)
          .set(group.toJson());
      print("Group created successfully!");
    } catch (e) {
      print("Error creating group: $e");
    }
  }

  // Create a new group
  Future<void> createTransaction(t.Transaction transaction) async {
    try {
      await _firestore
          .collection('transaction')
          .doc(transaction.transactionId)
          .set(transaction.toJson());
      print("Group created successfully!");
    } catch (e) {
      print("Error creating group: $e");
    }
  }

  Future<User> fetchMember(String id) async {
    try {
      return _firestore
          .collection('users')
          .where("userId", isEqualTo: id)
          .get()
          .then((doc) {
        return User.fromJson(doc.docs.first.data() as Map<String, dynamic>);
      });
    } catch (e) {
      print("Error fetching member: $e");
      return User(userId: '', name: '', balance: 0, groups: []);
    }
  }

  Future<t.Transaction> fetchTransaction(String id) async {
    try {
      return _firestore
          .collection('transactions')
          .where("transactionId", isEqualTo: id)
          .get()
          .then((doc) {
        return t.Transaction.fromJson(
            doc.docs.first.data() as Map<String, dynamic>);
      });
    } catch (e) {
      print("here");
      print("Error fetching transaction: $e");
      return t.Transaction(
          transactionId: '',
          groupId: '',
          description: '',
          timestamp: '',
          amount: '',
          contributions: {});
    }
  }

  Future<List<Group>> getGroups() async {
    List<Group> toReturn = [];
    List<User> members = [];
    List<t.Transaction> transactions = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('groups').get();
      for (var doc in snapshot.docs) {
        for (var member in doc.data()['users']) {
          members.add(await fetchMember(member));
        }

        for (var transaction in doc.data()['transactions']) {
          transactions.add(await fetchTransaction(transaction));
        }

        toReturn.add(Group(
            groupId: doc.data()['groupId'],
            groupName: doc.data()['groupName'],
            members: members,
            transactions: transactions));
        print(doc.data());
      }
      return toReturn;
    } catch (e) {
      print("Error fetching groups: $e");
      return [];
    }
  }

  // Future<List<Group>> getGroups() async {
  //   try {
  //     QuerySnapshot snapshot = await _firestore.collection('groups').get();
  //     return snapshot.docs
  //         .map((doc) => Group.fromJson(doc.data() as Map<String, dynamic>))
  //         .toList();
  //   } catch (e) {
  //     print("Error fetching groups: $e");
  //     return [];
  //   }
  // }

  Future<Group?> getGroup(String groupId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('groups').doc(groupId).get();
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
