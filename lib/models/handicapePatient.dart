class Handicapepatient {
  int id_handicape_patient;
  int id_patient;
  int id_handicape;
  String categorie;
  int niveau_gravite;

  Handicapepatient({
    required this.id_handicape_patient,
    required this.id_patient,
    required this.id_handicape,
    required this.categorie,
    required this.niveau_gravite
  });

  // Factory constructor to create a Handicapepatient object from JSON
  factory Handicapepatient.fromJson(Map<String, dynamic> json) {
    return Handicapepatient(
      id_handicape_patient: json['id_handicape_patient'],
      id_patient: json['id_patient'],
      id_handicape: json['id_handicape'],
      categorie: json['categorie'],
      niveau_gravite: json['niveau_gravite'],
    );
  }

  // Method to convert a Handicapepatient object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_handicape_patient': id_handicape_patient,
      'id_patient': id_patient,
      'id_handicape': id_handicape,
      'categorie': categorie,
      'niveau_gravite': niveau_gravite,
    };
  }
}
