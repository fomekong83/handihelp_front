class PlaningReeducation {
  int id_planing;
  DateTime date_debut;
  DateTime date_fin;
  bool statut;

  PlaningReeducation({
    required this.id_planing,
    required this.date_debut,
    required this.date_fin,
    required this.statut
  });

  // Factory constructor to create a PlaningReeducation object from JSON
  factory PlaningReeducation.fromJson(Map<String, dynamic> json) {
    return PlaningReeducation(
      id_planing: json['id_planing'],
      date_debut: DateTime.parse(json['date_debut']),
      date_fin: DateTime.parse(json['date_fin']),
      statut: json['statut'],
    );
  }

  // Method to convert a PlaningReeducation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_planing': id_planing,
      'date_debut': date_debut.toIso8601String(),
      'date_fin': date_fin.toIso8601String(),
      'statut': statut,
    };
  }
}
