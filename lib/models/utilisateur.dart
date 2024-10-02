class Utilisateur {
  String id_utilisateur;
  String nom;
  String prenom;
  String email;
  int telephone;

  Utilisateur({
    required this.id_utilisateur,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone
  });

  // Factory constructor to create an Utilisateur object from JSON
  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id_utilisateur: json['id_utilisateur'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      telephone: json['telephone'],
    );
  }

  // Method to convert an Utilisateur object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_utilisateur': id_utilisateur,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
    };
  }
}
