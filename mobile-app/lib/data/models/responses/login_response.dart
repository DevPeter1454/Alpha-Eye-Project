class LoginResponse {
  String? accessToken;
  String? tokenType;
  User? user;

  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
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

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
      };
}
