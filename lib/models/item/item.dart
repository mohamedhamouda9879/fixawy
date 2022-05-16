class ItemsModel {
  List<Data>? data;
  List<Included>? included;
  Meta? meta;
  Links? links;

  ItemsModel({this.data, this.included, this.meta, this.links});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['included'] != null) {
      included = <Included>[];
      json['included'].forEach((v) {
        included!.add(new Included.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }
}

class Data {
  String? type;
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  Data({this.type, this.id, this.attributes, this.relationships});

  Data.fromJson(Map<String, dynamic> json) {
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
  double? menuPrice;
  int? minimumQty;
  bool? menuStatus;
  int? menuPriority;
  Null? orderRestriction;
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
  List<Data1>? data;

  Categories({this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
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

class Data1 {
  String? type;
  String? id;

  Data1({this.type, this.id});

  Data1.fromJson(Map<String, dynamic> json) {
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

class Included {
  String? type;
  String? id;
  Attributes1? attributes;

  Included({this.type, this.id, this.attributes});

  Included.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes1.fromJson(json['attributes'])
        : null;
  }
}

class Attributes1 {
  String? name;
  String? description;
  String? parentId;
  int? priority;
  bool? status;
  int? nestLeft;
  int? nestRight;
  String? permalinkSlug;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Attributes1(
      {this.name,
      this.description,
      this.parentId,
      this.priority,
      this.status,
      this.nestLeft,
      this.nestRight,
      this.permalinkSlug,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Attributes1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    parentId = json['parent_id'];
    priority = json['priority'];
    status = json['status'];
    nestLeft = json['nest_left'];
    nestRight = json['nest_right'];
    permalinkSlug = json['permalink_slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? menuId;
  int? categoryId;

  Pivot({this.menuId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    menuId = json['menu_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id'] = this.menuId;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Links {
  String? self;
  String? first;
  String? last;

  Links({this.self, this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}
