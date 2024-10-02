class Preocupation {
  int id_preocupation;
  int id_patient;
  String type_preocupation;
  String description;
  bool statut;
  DateTime date_creation;

  Preocupation({
    required this.id_preocupation,
    required this.id_patient,
    required this.type_preocupation,
    required this.description,
    required this.statut,
    required this.date_creation
  });

  // Factory constructor to create a Preocupation object from JSON
  factory Preocupation.fromJson(Map<String, dynamic> json) {
    return Preocupation(
      id_preocupation: json['id_preocupation'],
      id_patient: json['id_patient'],
      type_preocupation: json['type_preocupation'],
      description: json['description'],
      statut: json['statut'],
      date_creation: DateTime.parse(json['date_creation']),
    );
  }

  // Method to convert a Preocupation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_preocupation': id_preocupation,
      'id_patient': id_patient,
      'type_preocupation': type_preocupation,
      'description': description,
      'statut': statut,
      'date_creation': date_creation.toIso8601String(),
    };
  }
}
