class Transaction {
  final String transactionId;   // Unique identifier for the transaction
  final String groupId;         // ID of the group associated with the transaction
  final String? utilityId;      // ID of the utility (nullable, optional)
  final String description;     // Description of the transaction
  final String timestamp;       // Timestamp of the transaction
  final String amount;          // Amount (stored as a string)
  final Map<String, double> contributions; // Map of user IDs to their contributions

  Transaction({
    required this.transactionId,
    required this.groupId,
    this.utilityId,
    required this.description,
    required this.timestamp,
    required this.amount,
    required this.contributions,
  });

  // From JSON factory method
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'] as String,
      groupId: json['groupId'] as String,
      utilityId: json['utilityId'] as String?,
      description: json['description'] as String,
      timestamp: json['timestamp'] as String,
      amount: json['amount'] as String,
      contributions: (json['contributions'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value as double)),
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'groupId': groupId,
      'utilityId': utilityId,
      'description': description,
      'timestamp': timestamp,
      'amount': amount,
      'contributions': contributions,
    };
  }
}
