class OrderModel {
  String? type;
  String? id;
  Attributes? attributes;

  OrderModel({this.type, this.id, this.attributes});

  OrderModel.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  String? firstName;
  String? lastName;
  String? email;
  String? telephone;
  int? locationId;
  Null? addressId;
  int? totalItems;
  String? comment;
  String? payment;
  String? orderType;
  String? createdAt;
  String? updatedAt;
  String? orderTime;
  String? orderDate;
  dynamic orderTotal;
  int? statusId;
  String? ipAddress;
  String? userAgent;
  Null? assigneeId;
  Null? assigneeGroupId;
  String? invoicePrefix;
  String? invoiceDate;
  String? hash;
  bool? processed;
  String? statusUpdatedAt;
  Null? assigneeUpdatedAt;
  bool? orderTimeIsAsap;
  int? techId;
  String? customerName;
  String? orderTypeName;
  String? orderDateTime;
  Null? formattedAddress;
  String? statusName;
  Status? status;

  Attributes(
      {this.customerId,
      this.firstName,
      this.lastName,
      this.email,
      this.telephone,
      this.locationId,
      this.addressId,
      this.totalItems,
      this.comment,
      this.payment,
      this.orderType,
      this.createdAt,
      this.updatedAt,
      this.orderTime,
      this.orderDate,
      this.orderTotal,
      this.statusId,
      this.ipAddress,
      this.userAgent,
      this.assigneeId,
      this.assigneeGroupId,
      this.invoicePrefix,
      this.invoiceDate,
      this.hash,
      this.processed,
      this.statusUpdatedAt,
      this.assigneeUpdatedAt,
      this.orderTimeIsAsap,
      this.techId,
      this.customerName,
      this.orderTypeName,
      this.orderDateTime,
      this.formattedAddress,
      this.statusName,
      this.status});

  Attributes.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    telephone = json['telephone'];
    locationId = json['location_id'];
    addressId = json['address_id'];
    totalItems = json['total_items'];
    comment = json['comment'];
    payment = json['payment'];
    orderType = json['order_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderTime = json['order_time'];
    orderDate = json['order_date'];
    orderTotal = json['order_total'];
    statusId = json['status_id'];
    ipAddress = json['ip_address'];
    userAgent = json['user_agent'];
    assigneeId = json['assignee_id'];
    assigneeGroupId = json['assignee_group_id'];
    invoicePrefix = json['invoice_prefix'];
    invoiceDate = json['invoice_date'];
    hash = json['hash'];
    processed = json['processed'];
    statusUpdatedAt = json['status_updated_at'];
    assigneeUpdatedAt = json['assignee_updated_at'];
    orderTimeIsAsap = json['order_time_is_asap'];
    techId = json['tech_id'];
    customerName = json['customer_name'];
    orderTypeName = json['order_type_name'];
    orderDateTime = json['order_date_time'];
    formattedAddress = json['formatted_address'];
    statusName = json['status_name'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['location_id'] = this.locationId;
    data['address_id'] = this.addressId;
    data['total_items'] = this.totalItems;
    data['comment'] = this.comment;
    data['payment'] = this.payment;
    data['order_type'] = this.orderType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_time'] = this.orderTime;
    data['order_date'] = this.orderDate;
    data['order_total'] = this.orderTotal;
    data['status_id'] = this.statusId;
    data['ip_address'] = this.ipAddress;
    data['user_agent'] = this.userAgent;
    data['assignee_id'] = this.assigneeId;
    data['assignee_group_id'] = this.assigneeGroupId;
    data['invoice_prefix'] = this.invoicePrefix;
    data['invoice_date'] = this.invoiceDate;
    data['hash'] = this.hash;
    data['processed'] = this.processed;
    data['status_updated_at'] = this.statusUpdatedAt;
    data['assignee_updated_at'] = this.assigneeUpdatedAt;
    data['order_time_is_asap'] = this.orderTimeIsAsap;
    data['tech_id'] = this.techId;
    data['customer_name'] = this.customerName;
    data['order_type_name'] = this.orderTypeName;
    data['order_date_time'] = this.orderDateTime;
    data['formatted_address'] = this.formattedAddress;
    data['status_name'] = this.statusName;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  int? statusId;
  String? statusName;
  String? statusComment;
  bool? notifyCustomer;
  String? statusFor;
  String? statusColor;
  String? createdAt;
  String? updatedAt;

  Status(
      {this.statusId,
      this.statusName,
      this.statusComment,
      this.notifyCustomer,
      this.statusFor,
      this.statusColor,
      this.createdAt,
      this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    statusId = json['status_id'];
    statusName = json['status_name'];
    statusComment = json['status_comment'];
    notifyCustomer = json['notify_customer'];
    statusFor = json['status_for'];
    statusColor = json['status_color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_id'] = this.statusId;
    data['status_name'] = this.statusName;
    data['status_comment'] = this.statusComment;
    data['notify_customer'] = this.notifyCustomer;
    data['status_for'] = this.statusFor;
    data['status_color'] = this.statusColor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
