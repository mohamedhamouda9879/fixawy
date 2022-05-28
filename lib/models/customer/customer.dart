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
  int? rating;
  String? notes;
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
      this.rating,
      this.notes,
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
    rating = json['rating'];
    notes = json['notes'];
    fullName = json['full_name'];
  }
}
