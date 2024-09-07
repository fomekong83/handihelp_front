
class User {
	String id_user;
	String? id_centre;
	String name;
	int phone;
	bool status = true;
	String? verified_at;


  User({
    required this.id_user,
    this.id_centre,
		required this.name,
		required this.phone,
		required this.status,
		required this.verified_at,
  });


	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			id_user: json['id_user'],
			id_centre: json['id_centre'],
			name: json['name'],
			phone: int.parse(json['phone'].toString()) ?? 0,
			verified_at: json['verified_at'] ?? "",
			status: json['status'] == 1 ? true : false,
			//centres: json['centres'] == null ? [] : List<Centre>.from(json['centres'].map((e) => Centre.fromJson(e))).toList(),
		);
	}



	Map<String, dynamic> toJson() {
  return {
    'id_user': id_user,
    'id_centre': id_centre,
    'name': name,
    'phone': phone,
    'status': status,
    'verified_at': verified_at,
  };

}

}
