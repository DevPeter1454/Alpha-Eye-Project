class RegisterParam {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;

  RegisterParam({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
  });

  RegisterParam.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
