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
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
