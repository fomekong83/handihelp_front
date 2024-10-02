class Prescription {
  int id_prescription;
  String medicament;
  String dosage;
  String frequence;
  String duree;

  Prescription({
    required this.id_prescription,
    required this.medicament,
    required this.dosage,
    required this.frequence,
    required this.duree,
  });

  // Factory constructor to create a Prescription object from JSON
  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      id_prescription: json['id_prescription'],
      medicament: json['medicament'],
      dosage: json['dosage'],
      frequence: json['frequence'],
      duree: json['duree'],
    );
  }

  // Method to convert a Prescription object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_prescription': id_prescription,
      'medicament': medicament,
      'dosage': dosage,
      'frequence': frequence,
      'duree': duree,
    };
  }
}
