class ForgetPasswordParam {
  String email;

  ForgetPasswordParam({
    required this.email,
  });

  factory ForgetPasswordParam.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordParam(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
