class RegisterParam {
  String firstname;
  String lastname;
  int age;
  String gender;
  String address;
  String city;
  String stateOfResidence;
  String phone;
  String email;
  String role;
  String password;

  RegisterParam({
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.gender,
    required this.address,
    required this.city,
    required this.stateOfResidence,
    required this.phone,
    required this.email,
    required this.role,
    required this.password,
  });

  factory RegisterParam.fromJson(Map<String, dynamic> json) => RegisterParam(
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
        password: json["password"],
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
        "password": password,
      };
}
