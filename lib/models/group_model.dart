import './users.dart';       // Import the User model
import './group_transactions.dart'; // Import the Transaction model
import './utilities.dart';    // Import the Utility model

class Group {
  final String groupId;                 // Unique identifier for the group
  final List<User> members;             // List of users in the group
  final List<Utility>? utilities;       // Optional list of utilities (nullable)
  final List<Transaction> transactions; // List of transactions associated with the group

  Group({
    required this.groupId,
    required this.members,
    this.utilities,
    required this.transactions,
  });

  // From JSON factory method
  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupId: json['groupId'] as String,
      members: (json['members'] as List<dynamic>)
          .map((member) => User.fromJson(member as Map<String, dynamic>))
          .toList(),
      utilities: json['utilities'] != null
          ? (json['utilities'] as List<dynamic>)
              .map((utility) => Utility.fromJson(utility as Map<String, dynamic>))
              .toList()
          : null,
      transactions: (json['transactions'] as List<dynamic>)
          .map((transaction) =>
              Transaction.fromJson(transaction as Map<String, dynamic>))
          .toList(),
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'members': members.map((member) => member.toJson()).toList(),
      'utilities': utilities?.map((utility) => utility.toJson()).toList(),
      'transactions': transactions.map((transaction) => transaction.toJson()).toList(),
    };
  }

  // Utility methods to check group type
  String get groupType => utilities == null ? 'Clique' : 'Household'; // Determine group type
}

