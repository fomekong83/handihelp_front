class Tableauvisualisation {
  int id_tableau;
  int progression;
  DateTime date_debut;
  String resultat;

  Tableauvisualisation({
    required this.id_tableau,
    required this.progression,
    required this.date_debut,
    required this.resultat
  });

  // Factory constructor to create a Tableauvisualisation object from JSON
  factory Tableauvisualisation.fromJson(Map<String, dynamic> json) {
    return Tableauvisualisation(
      id_tableau: json['id_tableau'],
      progression: json['progression'],
      date_debut: DateTime.parse(json['date_debut']),
      resultat: json['resultat'],
    );
  }

  // Method to convert a Tableauvisualisation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_tableau': id_tableau,
      'progression': progression,
      'date_debut': date_debut.toIso8601String(),
      'resultat': resultat,
    };
  }
}
