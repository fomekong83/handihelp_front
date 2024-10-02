class Exercices {
  int id_exercie;
  String description;
  String lien;
  int duree;

  Exercices({
    required this.id_exercie,
    required this.description,
    required this.lien,
    required this.duree
  });

  // Factory constructor to create an Exercices object from JSON
  factory Exercices.fromJson(Map<String, dynamic> json) {
    return Exercices(
      id_exercie: json['id_exercie'],
      description: json['description'],
      lien: json['lien'],
      duree: json['duree'],
    );
  }

  // Method to convert an Exercices object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_exercie': id_exercie,
      'description': description,
      'lien': lien,
      'duree': duree,
    };
  }
}
