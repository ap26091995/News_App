class CouponsModel {
  int? id;
  String? code;
  String? amount;
  String? status;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? discountType;
  String? description;
  Null? dateExpires;
  Null? dateExpiresGmt;
  int? usageCount;
  bool? individualUse;

  bool? freeShipping;
  List<Null>? productCategories;
  List<Null>? excludedProductCategories;
  bool? excludeSaleItems;
  String? minimumAmount;
  String? maximumAmount;
  List<Null>? emailRestrictions;
  List<Null>? usedBy;
  List<Null>? metaData;
  Links? lLinks;

  CouponsModel(
      {this.id,
        this.code,
        this.amount,
        this.status,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.discountType,
        this.description,
        this.dateExpires,
        this.dateExpiresGmt,
        this.usageCount,
        this.individualUse,
        this.freeShipping,
        this.productCategories,
        this.excludedProductCategories,
        this.excludeSaleItems,
        this.minimumAmount,
        this.maximumAmount,
        this.emailRestrictions,
        this.usedBy,
        this.metaData,
        this.lLinks});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    amount = json['amount'];
    status = json['status'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    discountType = json['discount_type'];
    description = json['description'];
    dateExpires = json['date_expires'];
    dateExpiresGmt = json['date_expires_gmt'];
    usageCount = json['usage_count'];
    individualUse = json['individual_use'];

    freeShipping = json['free_shipping'];

    excludeSaleItems = json['exclude_sale_items'];
    minimumAmount = json['minimum_amount'];
    maximumAmount = json['maximum_amount'];

    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_type'] = this.discountType;
    data['description'] = this.description;
    data['date_expires'] = this.dateExpires;
    data['date_expires_gmt'] = this.dateExpiresGmt;
    data['usage_count'] = this.usageCount;
    data['individual_use'] = this.individualUse;

    data['free_shipping'] = this.freeShipping;

    data['exclude_sale_items'] = this.excludeSaleItems;
    data['minimum_amount'] = this.minimumAmount;
    data['maximum_amount'] = this.maximumAmount;

    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Self>? collection;

  Links({this.self, this.collection});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <Self>[];
      json['collection'].forEach((v) {
        collection!.add(new Self.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
