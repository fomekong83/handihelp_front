class HopitalMedecin {
  int id_medecin;
  int id_hopital;
  bool est_directeur;

  HopitalMedecin({
    required this.id_medecin,
    required this.id_hopital,
    required this.est_directeur
  });

  // Factory constructor to create a HopitalMedecin object from JSON
  factory HopitalMedecin.fromJson(Map<String, dynamic> json) {
    return HopitalMedecin(
      id_medecin: json['id_medecin'],
      id_hopital: json['id_hopital'],
      est_directeur: json['est_directeur'],
    );
  }

  // Method to convert a HopitalMedecin object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_medecin': id_medecin,
      'id_hopital': id_hopital,
      'est_directeur': est_directeur,
    };
  }
}
