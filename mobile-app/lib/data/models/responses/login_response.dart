class LoginResponse {
  int? code;
  DateTime? expire;
  String? token;

  LoginResponse({
    this.code,
    this.expire,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        expire: json["expire"] != null ? DateTime.parse(json["expire"]) : null,
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "expire": expire?.toIso8601String(),
        "token": token,
      };
}
