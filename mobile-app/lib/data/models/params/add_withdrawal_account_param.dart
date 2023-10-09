class AddWithdrawalAccountParam {
  String accountNumber;
  String accountName;
  String bankCode;

  AddWithdrawalAccountParam({
    required this.accountNumber,
    required this.accountName,
    required this.bankCode,
  });

  factory AddWithdrawalAccountParam.fromJson(Map<String, dynamic> json) =>
      AddWithdrawalAccountParam(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankCode: json["bank_code"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_code": bankCode,
      };
}
