class ResendVerificationParam {
  String email;

  ResendVerificationParam({
    required this.email,
  });

  factory ResendVerificationParam.fromJson(Map<String, dynamic> json) =>
      ResendVerificationParam(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
