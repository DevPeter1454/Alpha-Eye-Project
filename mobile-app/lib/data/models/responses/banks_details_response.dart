class BankDetailsResponse {
  String accountNumber;
  String accountName;

  BankDetailsResponse({
    required this.accountNumber,
    required this.accountName,
  });

  factory BankDetailsResponse.fromJson(Map<String, dynamic> json) =>
      BankDetailsResponse(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
      };
}
