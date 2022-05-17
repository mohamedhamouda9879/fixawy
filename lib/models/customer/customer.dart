class CustomerModel {
  String? type;
  String? id;
  Attributes? attributes;

  CustomerModel({this.type, this.id, this.attributes});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? firstName;
  String? lastName;
  String? email;
  String? telephone;
  String? addressId;
  bool? newsletter;
  int? customerGroupId;
  String? ipAddress;
  String? createdAt;
  bool? status;
  String? resetCode;
  String? resetTime;
  String? activationCode;
  String? rememberToken;
  bool? isActivated;
  String? dateActivated;
  String? lastLogin;
  String? lastSeen;
  String? updatedAt;
  String? lastLocationArea;
  String? fullName;

  Attributes(
      {this.firstName,
      this.lastName,
      this.email,
      this.telephone,
      this.addressId,
      this.newsletter,
      this.customerGroupId,
      this.ipAddress,
      this.createdAt,
      this.status,
      this.resetCode,
      this.resetTime,
      this.activationCode,
      this.rememberToken,
      this.isActivated,
      this.dateActivated,
      this.lastLogin,
      this.lastSeen,
      this.updatedAt,
      this.lastLocationArea,
      this.fullName});

  Attributes.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    telephone = json['telephone'];
    addressId = json['address_id'];
    newsletter = json['newsletter'];
    customerGroupId = json['customer_group_id'];
    ipAddress = json['ip_address'];
    createdAt = json['created_at'];
    status = json['status'];
    resetCode = json['reset_code'];
    resetTime = json['reset_time'];
    activationCode = json['activation_code'];
    rememberToken = json['remember_token'];
    isActivated = json['is_activated'];
    dateActivated = json['date_activated'];
    lastLogin = json['last_login'];
    lastSeen = json['last_seen'];
    updatedAt = json['updated_at'];
    lastLocationArea = json['last_location_area'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['address_id'] = this.addressId;
    data['newsletter'] = this.newsletter;
    data['customer_group_id'] = this.customerGroupId;
    data['ip_address'] = this.ipAddress;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['reset_code'] = this.resetCode;
    data['reset_time'] = this.resetTime;
    data['activation_code'] = this.activationCode;
    data['remember_token'] = this.rememberToken;
    data['is_activated'] = this.isActivated;
    data['date_activated'] = this.dateActivated;
    data['last_login'] = this.lastLogin;
    data['last_seen'] = this.lastSeen;
    data['updated_at'] = this.updatedAt;
    data['last_location_area'] = this.lastLocationArea;
    data['full_name'] = this.fullName;
    return data;
  }
}
