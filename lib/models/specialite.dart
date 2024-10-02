class Specialite {
  int id_specialite;
  String titre;
  String description;
  bool statut;

  Specialite({
    required this.id_specialite,
    required this.titre,
    required this.description,
    required this.statut
  });

  // Factory constructor to create a Specialite object from JSON
  factory Specialite.fromJson(Map<String, dynamic> json) {
    return Specialite(
      id_specialite: json['id_specialite'],
      titre: json['titre'],
      description: json['description'],
      statut: json['statut'],
    );
  }

  // Method to convert a Specialite object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_specialite': id_specialite,
      'titre': titre,
      'description': description,
      'statut': statut,
    };
  }
}
