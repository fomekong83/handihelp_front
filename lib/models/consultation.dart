class Consultation {
  int id_consultation;
  DateTime date_consultation;
  String motif;
  String diagnostic;
  String traitement;
  String notes;

  Consultation({
    required this.id_consultation,
    required this.date_consultation,
    required this.motif,
    required this.diagnostic,
    required this.traitement,
    required this.notes,
  });

  // Factory constructor to create a Consultation object from JSON
  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id_consultation: json['id_consultation'],
      date_consultation: DateTime.parse(json['date_consultation']),
      motif: json['motif'],
      diagnostic: json['diagnostic'],
      traitement: json['traitement'],
      notes: json['notes'],
    );
  }

  // Method to convert a Consultation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_consultation': id_consultation,
      'date_consultation': date_consultation.toIso8601String(),
      'motif': motif,
      'diagnostic': diagnostic,
      'traitement': traitement,
      'notes': notes,
    };
  }
}
