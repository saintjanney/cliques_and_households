class User {
  final String userId;    // Unique identifier for the user
  final String name;      // Name of the user
  final double balance;   // User's balance
  final List<String> groups; // List of group IDs the user belongs to

  User({
    required this.userId,
    required this.name,
    required this.balance,
    required this.groups,
  });

  // From JSON factory method
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      groups: List<String>.from(json['groups'] as List),
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'balance': balance,
      'groups': groups,
    };
  }
}

