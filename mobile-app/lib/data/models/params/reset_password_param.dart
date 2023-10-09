class ResetPasswordParam {
  String email;
  String token;
  String password;

  ResetPasswordParam({
    required this.email,
    required this.token,
    required this.password,
  });

  factory ResetPasswordParam.fromJson(Map<String, dynamic> json) =>
      ResetPasswordParam(
        email: json["email"],
        token: json["token"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "password": password,
      };
}
