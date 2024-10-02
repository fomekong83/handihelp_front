import 'dart:async';

class ExerciceSeance {
  int id_exerciceSeance;
  int duree;
  String intensite;
  Timer heure;
  int est_fait;
  int point;

  ExerciceSeance({
    required this.id_exerciceSeance,
    required this.duree,
    required this.intensite,
    required this.heure,
    required this.est_fait,
    required this.point
  });

  // Factory constructor to create an ExerciceSeance object from JSON
  factory ExerciceSeance.fromJson(Map<String, dynamic> json) {
    return ExerciceSeance(
      id_exerciceSeance: json['id_exerciceSeance'],
      duree: json['duree'],
      intensite: json['intensite'],
      heure: Timer(Duration(seconds: json['heure']), () {}), // Create a dummy Timer
      est_fait: json['est_fait'],
      point: json['point'],
    );
  }

  // Method to convert an ExerciceSeance object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_exerciceSeance': id_exerciceSeance,
      'duree': duree,
      'intensite': intensite,
      'heure': heure.tick, // Store the current tick count of the Timer
      'est_fait': est_fait,
      'point': point,
    };
  }
}
