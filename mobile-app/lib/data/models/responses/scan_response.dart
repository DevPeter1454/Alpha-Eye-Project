class ScanResponse {
  Scan? scan;
  DetailedDescription? detailedDescription;

  ScanResponse({
    this.scan,
    this.detailedDescription,
  });

  factory ScanResponse.fromJson(Map<String, dynamic> json) => ScanResponse(
        scan: json["scan"] == null ? null : Scan.fromJson(json["scan"]),
        detailedDescription: json["detailed_description"] == null
            ? null
            : DetailedDescription.fromJson(json["detailed_description"]),
      );

  Map<String, dynamic> toJson() => {
        "scan": scan?.toJson(),
        "detailed_description": detailedDescription?.toJson(),
      };
}

class DetailedDescription {
  String? title;
  String? description;
  String? recommendation;

  DetailedDescription({
    this.title,
    this.description,
    this.recommendation,
  });

  factory DetailedDescription.fromJson(Map<String, dynamic> json) =>
      DetailedDescription(
        title: json["title"],
        description: json["description"],
        recommendation: json["recommendation"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "recommendation": recommendation,
      };
}

class Scan {
  String? labelName;
  int? labelConfidence;
  String? severity;
  String? title;
  String? recommendation;
  DateTime? createdAt;
  String? detectedConditions;
  String? labelId;
  String? scanId;
  String? healthStatus;
  String? description;
  String? specialId;
  DateTime? updatedAt;

  Scan({
    this.labelName,
    this.labelConfidence,
    this.severity,
    this.title,
    this.recommendation,
    this.createdAt,
    this.detectedConditions,
    this.labelId,
    this.scanId,
    this.healthStatus,
    this.description,
    this.specialId,
    this.updatedAt,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        labelName: json["label_name"],
        labelConfidence: json["label_confidence"],
        severity: json["severity"],
        title: json["title"],
        recommendation: json["recommendation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        detectedConditions: json["detected_conditions"],
        labelId: json["label_id"],
        scanId: json["scan_id"],
        healthStatus: json["health_status"],
        description: json["description"],
        specialId: json["special_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "label_name": labelName,
        "label_confidence": labelConfidence,
        "severity": severity,
        "title": title,
        "recommendation": recommendation,
        "created_at": createdAt?.toIso8601String(),
        "detected_conditions": detectedConditions,
        "label_id": labelId,
        "scan_id": scanId,
        "health_status": healthStatus,
        "description": description,
        "special_id": specialId,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
