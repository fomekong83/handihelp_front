class Seance {
  int id_seance;
  DateTime date_seance;
  String description;

  Seance({
    required this.id_seance,
    required this.date_seance,
    required this.description
  });

  // Factory constructor to create a Seance object from JSON
  factory Seance.fromJson(Map<String, dynamic> json) {
    return Seance(
      id_seance: json['id_seance'],
      date_seance: DateTime.parse(json['date_seance']),
      description: json['description'],
    );
  }

  // Method to convert a Seance object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_seance': id_seance,
      'date_seance': date_seance.toIso8601String(),
      'description': description,
    };
  }
}
