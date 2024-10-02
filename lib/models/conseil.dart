class Conseil {
  final int id_conseil;
  final int id_medecin;
  final String contenu;
  final DateTime date_conseil;

  Conseil({
    required this.id_conseil,
    required this.id_medecin,
    required this.contenu,
    required this.date_conseil,
  });

  factory Conseil.fromJson(Map<String, dynamic> json) {
    return Conseil(
      id_conseil: json['id_conseil'],
      id_medecin: json['id_medecin'],
      contenu: json['contenu'],
      date_conseil: DateTime.parse(json['date_conseil']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_conseil': id_conseil,
      'id_medecin': id_medecin,
      'contenu': contenu,
      'date_conseil': date_conseil.toIso8601String(),
    };
  }
}
