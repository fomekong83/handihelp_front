class Hopital {
  int id_hopital;
  String nom;
  String email;
  int telephone;
  String code_pay;
  String ville;
  String description;
  bool statut;

  Hopital({
    required this.id_hopital,
    required this.nom,
    required this.email,
    required this.telephone,
    required this.code_pay,
    required this.ville,
    required this.description,
    required this.statut
  });

  // Factory constructor to create a Hopital object from JSON
  factory Hopital.fromJson(Map<String, dynamic> json) {
    return Hopital(
      id_hopital: json['id_hopital'],
      nom: json['nom'],
      email: json['email'],
      telephone: json['telephone'],
      code_pay: json['code_pay'],
      ville: json['ville'],
      description: json['description'],
      statut: json['statut'],
    );
  }

  // Method to convert a Hopital object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_hopital': id_hopital,
      'nom': nom,
      'email': email,
      'telephone': telephone,
      'code_pay': code_pay,
      'ville': ville,
      'description': description,
      'statut': statut,
    };
  }
}
