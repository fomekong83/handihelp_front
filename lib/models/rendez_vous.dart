class RendezVous {
  int id_rendezvous;
  int id_medecin;
  int id_patient;
  DateTime date_rendezvous;
  bool statut;
  String observation;

  RendezVous({
    required this.id_rendezvous,
    required this.id_medecin,
    required this.id_patient,
    required this.date_rendezvous,
    required this.statut,
    required this.observation
  });

  // Factory constructor to create a RendezVous object from JSON
  factory RendezVous.fromJson(Map<String, dynamic> json) {
    return RendezVous(
      id_rendezvous: json['id_rendezvous'],
      id_medecin: json['id_medecin'],
      id_patient: json['id_patient'],
      date_rendezvous: DateTime.parse(json['date_rendezvous']),
      statut: json['statut'],
      observation: json['observation'],
    );
  }

  // Method to convert a RendezVous object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_rendezvous': id_rendezvous,
      'id_medecin': id_medecin,
      'id_patient': id_patient,
      'date_rendezvous': date_rendezvous.toIso8601String(),
      'statut': statut,
      'observation': observation,
    };
  }
}
