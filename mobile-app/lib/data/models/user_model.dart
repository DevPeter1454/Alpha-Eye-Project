class User {
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  Student? student;

  User({this.firstName, this.lastName, this.email, this.role, this.student});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    return data;
  }
}

class Student {
  String? sId;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Student({this.sId, this.user, this.createdAt, this.updatedAt, this.iV});

  Student.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Educator {
  String? sId;
  String? user;
  String? currentSubscription;
  String? stripeCustomerId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Educator(
      {this.sId,
      this.user,
      this.currentSubscription,
      this.stripeCustomerId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Educator.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    currentSubscription = json['currentSubscription'];
    stripeCustomerId = json['stripeCustomerId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['currentSubscription'] = currentSubscription;
    data['stripeCustomerId'] = stripeCustomerId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
