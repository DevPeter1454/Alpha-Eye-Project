class BankListResponse {
  String name;
  String slug;
  String code;
  String longcode;
  dynamic gateway;
  bool payWithBank;
  bool active;
  bool isDeleted;
  String country;
  String currency;
  String type;
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  BankListResponse({
    required this.name,
    required this.slug,
    required this.code,
    required this.longcode,
    required this.gateway,
    required this.payWithBank,
    required this.active,
    required this.isDeleted,
    required this.country,
    required this.currency,
    required this.type,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankListResponse.fromJson(Map<String, dynamic> json) =>
      BankListResponse(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        gateway: json["gateway"],
        payWithBank: json["pay_with_bank"],
        active: json["active"],
        isDeleted: json["is_deleted"],
        country: json["country"],
        currency: json["currency"],
        type: json["type"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "gateway": gateway,
        "pay_with_bank": payWithBank,
        "active": active,
        "is_deleted": isDeleted,
        "country": country,
        "currency": currency,
        "type": type,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}


/*
if (banksList.value.isNotEmpty)
                      const Spacing.mediumHeight(),
                    if (banksList.value.isNotEmpty)
                      const AppText(
                        'Select Bank',
                        color: AppColors.black,
                        fontFamily: FontFamily.hovesRegular,
                        fontSize: 16,
                      ),
                    if (banksList.value.isNotEmpty) const Spacing.smallHeight(),
                    if (banksList.value.isNotEmpty)
                      DropdownButtonFormField(
                        isExpanded: true,
                        value: banksList.value[0],
                        decoration: InputDecoration(
                          //icon: SvgPicture.asset(AppAssets.arrowDownIos),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          // selectedBankTEC.value = value!;
                          /// print(selectedBankTEC.value);
                          print(value?.code);
                        },
                        items: banksList.value.map((bank) {
                          return DropdownMenuItem(
                            value: bank,
                            child: AppText(bank.name),
                          );
                        }).toList(),
                      ),

*/