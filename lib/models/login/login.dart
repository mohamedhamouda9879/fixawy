class LoginModel {
  int? statusCode;
  String? token;
  int? customerId;

  LoginModel({this.statusCode, this.token, this.customerId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    token = json['token'];
    customerId = json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['token'] = this.token;
    data['customer_id'] = this.customerId;
    return data;
  }
}
