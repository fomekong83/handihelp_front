class Patient {
  String id_patient;
  String nom_patient;
  String prenom_patient;
  String email_patient;
  int telephone;
  String date_naissance;
  bool statut;

  Patient({
    required this.id_patient,
    required this.nom_patient,
    required this.prenom_patient,
    required this.email_patient,
    required this.telephone,
    required this.date_naissance,
    required this.statut
  });

  // Factory constructor to create a Patient object from JSON
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id_patient: json['id_patient'],
      nom_patient: json['nom_patient'],
      prenom_patient: json['prenom_patient'],
      email_patient: json['email_patient'],
      telephone: json['telephone'],
      date_naissance: json['date_naissance'],
      statut: json['statut'],
    );
  }

  // Method to convert a Patient object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_patient': id_patient,
      'nom_patient': nom_patient,
      'prenom_patient': prenom_patient,
      'email_patient': email_patient,
      'telephone': telephone,
      'date_naissance': date_naissance,
      'statut': statut,
    };
  }
}
