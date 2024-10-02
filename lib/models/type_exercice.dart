class TypeExercice {
  int id_type;
  String nom;

  TypeExercice({
    required this.id_type,
    required this.nom
  });

  // Factory constructor to create a TypeExercice object from JSON
  factory TypeExercice.fromJson(Map<String, dynamic> json) {
    return TypeExercice(
      id_type: json['id_type'],
      nom: json['nom'],
    );
  }

  // Method to convert a TypeExercice object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_type': id_type,
      'nom': nom,
    };
  }
}
