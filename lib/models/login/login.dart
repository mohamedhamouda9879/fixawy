class LoginModel {
  int? statusCode;
  String? token;
  int? customerId;
  int? customerType;
  String? firstName;
  String? lastName;
  String? email;
  String? telephone;

  LoginModel(
      {this.statusCode,
      this.token,
      this.customerId,
      this.customerType,
      this.firstName,
      this.lastName,
      this.email,
      this.telephone});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    token = json['token'];
    customerId = json['customer_id'];
    customerType = json['customer_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['token'] = this.token;
    data['customer_id'] = this.customerId;
    data['customer_type'] = this.customerType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    return data;
  }
}
