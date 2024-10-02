class Handicape {
  int id_handicape;
  String nom;
  String description;

  Handicape({
    required this.id_handicape,
    required this.nom,
    required this.description
  });

  // Factory constructor to create a Handicape object from JSON
  factory Handicape.fromJson(Map<String, dynamic> json) {
    return Handicape(
      id_handicape: json['id_handicape'],
      nom: json['nom'],
      description: json['description'],
    );
  }

  // Method to convert a Handicape object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_handicape': id_handicape,
      'nom': nom,
      'description': description,
    };
  }
}
