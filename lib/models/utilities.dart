class Utility {
  final String id;   // Unique identifier for the utility
  final String name; // Name of the utility

  Utility({
    required this.id,
    required this.name,
  });

  // From JSON factory method
  factory Utility.fromJson(Map<String, dynamic> json) {
    return Utility(
      id: json['utilityId'] as String,
      name: json['utilityName'] as String,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'utilityId': id,
      'utilityName': name,
    };
  }
}
