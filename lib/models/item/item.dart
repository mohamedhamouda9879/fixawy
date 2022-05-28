class ItemModel {
  String? type;
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  ItemModel({this.type, this.id, this.attributes, this.relationships});

  ItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? new Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    if (this.relationships != null) {
      data['relationships'] = this.relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? menuName;
  String? menuDescription;
  dynamic menuPrice;
  int? minimumQty;
  bool? menuStatus;
  int? menuPriority;
  dynamic? orderRestriction;
  String? createdAt;
  String? updatedAt;
  int? stockQty;
  String? currency;

  Attributes(
      {this.menuName,
      this.menuDescription,
      this.menuPrice,
      this.minimumQty,
      this.menuStatus,
      this.menuPriority,
      this.orderRestriction,
      this.createdAt,
      this.updatedAt,
      this.stockQty,
      this.currency});

  Attributes.fromJson(Map<String, dynamic> json) {
    menuName = json['menu_name'];
    menuDescription = json['menu_description'];
    menuPrice = json['menu_price'];
    minimumQty = json['minimum_qty'];
    menuStatus = json['menu_status'];
    menuPriority = json['menu_priority'];
    orderRestriction = json['order_restriction'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stockQty = json['stock_qty'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_name'] = this.menuName;
    data['menu_description'] = this.menuDescription;
    data['menu_price'] = this.menuPrice;
    data['minimum_qty'] = this.minimumQty;
    data['menu_status'] = this.menuStatus;
    data['menu_priority'] = this.menuPriority;
    data['order_restriction'] = this.orderRestriction;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stock_qty'] = this.stockQty;
    data['currency'] = this.currency;
    return data;
  }
}

class Relationships {
  Categories? categories;

  Relationships({this.categories});

  Relationships.fromJson(Map<String, dynamic> json) {
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    return data;
  }
}

class Categories {
  List<Data>? data;

  Categories({this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? id;

  Data({this.type, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
