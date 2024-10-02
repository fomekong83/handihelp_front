class Medecin {
  String id_medecin;
  String nom_medecin;
  String prenom_medecin;
  String email_medecin;
  int telephone;
  String cabinet;
  bool statut;

  Medecin({
    required this.id_medecin,
    required this.nom_medecin,
    required this.prenom_medecin,
    required this.email_medecin,
    required this.telephone,
    required this.cabinet,
    required this.statut
  });

  // Factory constructor to create a Medecin object from JSON
  factory Medecin.fromJson(Map<String, dynamic> json) {
    return Medecin(
      id_medecin: json['id_medecin'],
      nom_medecin: json['nom_medecin'],
      prenom_medecin: json['prenom_medecin'],
      email_medecin: json['email_medecin'],
      telephone: json['telephone'],
      cabinet: json['cabinet'],
      statut: json['statut'],
    );
  }

  // Method to convert a Medecin object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_medecin': id_medecin,
      'nom_medecin': nom_medecin,
      'prenom_medecin': prenom_medecin,
      'email_medecin': email_medecin,
      'telephone': telephone,
      'cabinet': cabinet,
      'statut': statut,
    };
  }
}
