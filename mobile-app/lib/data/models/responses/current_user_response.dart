class CurrentUserResponse {
  String? firstname;
  String? lastname;
  int? age;
  String? gender;
  String? address;
  String? city;
  String? stateOfResidence;
  String? phone;
  String? email;
  String? role;
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? specialId;

  CurrentUserResponse({
    this.firstname,
    this.lastname,
    this.age,
    this.gender,
    this.address,
    this.city,
    this.stateOfResidence,
    this.phone,
    this.email,
    this.role,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.specialId,
  });

  factory CurrentUserResponse.fromJson(Map<String, dynamic> json) =>
      CurrentUserResponse(
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        city: json["city"],
        stateOfResidence: json["state_of_residence"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        specialId: json["special_id"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "gender": gender,
        "address": address,
        "city": city,
        "state_of_residence": stateOfResidence,
        "phone": phone,
        "email": email,
        "role": role,
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "special_id": specialId,
      };
}
