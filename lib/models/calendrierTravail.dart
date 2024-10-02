

class Calendriertravail{
  int id_calendrier;
  DateTime debut;
  DateTime fin;
  String description;
  String heure;
  String jour;

  Calendriertravail({ required this.id_calendrier, required this.debut, required this.fin, required this.description,required this.heure,required this.jour});

  factory Calendriertravail.fromJson(Map<String, dynamic> json) {
    return Calendriertravail(
      id_calendrier: json['id_calendrier'],
      debut: DateTime.parse(json['debut']),
      fin: DateTime.parse(json['fin']),
      description: json['description'],
      heure: json['heure'],
      jour: json['jour'],
    );
  }

}