class SpecialiteMedecin {
  int id_medecin;
  int id_specialite;
  bool statut;

  SpecialiteMedecin({
    required this.id_medecin,
    required this.id_specialite,
    required this.statut
  });

  // Factory constructor to create a SpecialiteMedecin object from JSON
  factory SpecialiteMedecin.fromJson(Map<String, dynamic> json) {
    return SpecialiteMedecin(
      id_medecin: json['id_medecin'],
      id_specialite: json['id_specialite'],
      statut: json['statut'],
    );
  }

  // Method to convert a SpecialiteMedecin object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_medecin': id_medecin,
      'id_specialite': id_specialite,
      'statut': statut,
    };
  }
}
