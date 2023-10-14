class HospitalResponse {
  String? hospitalName;
  String? address;
  String? city;
  String? state;
  String? hospitalId;
  String? logo;

  HospitalResponse({
    this.hospitalName,
    this.address,
    this.city,
    this.state,
    this.hospitalId,
    this.logo,
  });

  factory HospitalResponse.fromJson(Map<String, dynamic> json) =>
      HospitalResponse(
        hospitalName: json["hospital_name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        hospitalId: json["hospital_id"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "hospital_name": hospitalName,
        "address": address,
        "city": city,
        "state": state,
        "hospital_id": hospitalId,
        "logo": logo,
      };
}
