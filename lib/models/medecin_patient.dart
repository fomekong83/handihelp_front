class MedecinPatient {
  int id_medecin;
  int id_patient;

  MedecinPatient({
    required this.id_medecin,
    required this.id_patient
  });

  // Factory constructor to create a MedecinPatient object from JSON
  factory MedecinPatient.fromJson(Map<String, dynamic> json) {
    return MedecinPatient(
      id_medecin: json['id_medecin'],
      id_patient: json['id_patient'],
    );
  }

  // Method to convert a MedecinPatient object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_medecin': id_medecin,
      'id_patient': id_patient,
    };
  }
}
