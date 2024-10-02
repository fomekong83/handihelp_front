class ReponsePreocupation {
  int id_reponse;
  int id_preocupation;
  String reponse;

  ReponsePreocupation({
    required this.id_reponse,
    required this.id_preocupation,
    required this.reponse
  });

  // Factory constructor to create a ReponsePreocupation object from JSON
  factory ReponsePreocupation.fromJson(Map<String, dynamic> json) {
    return ReponsePreocupation(
      id_reponse: json['id_reponse'],
      id_preocupation: json['id_preocupation'],
      reponse: json['reponse'],
    );
  }

  // Method to convert a ReponsePreocupation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id_reponse': id_reponse,
      'id_preocupation': id_preocupation,
      'reponse': reponse,
    };
  }
}
