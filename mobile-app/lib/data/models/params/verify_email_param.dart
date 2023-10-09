class VerifyEmailParam {
  String pin;
  String email;

  VerifyEmailParam({
    required this.pin,
    required this.email,
  });

  factory VerifyEmailParam.fromJson(Map<String, dynamic> json) =>
      VerifyEmailParam(
        pin: json["pin"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "pin": pin,
        "email": email,
      };
}
