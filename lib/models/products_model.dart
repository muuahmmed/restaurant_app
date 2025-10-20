class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  List<Products>? _products;

  Product({
    int? totalSize,
    int? typeId,
    int? offset,
    List<Products>? products,
  }) {
    if (totalSize != null) {
      _totalSize = totalSize;
    }
    if (typeId != null) {
      _typeId = typeId;
    }
    if (offset != null) {
      _offset = offset;
    }
    if (products != null) {
      _products = products;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = _totalSize;
    data['type_id'] = _typeId;
    data['offset'] = _offset;
    if (_products != null) {
      data['products'] = _products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _stars;
  String? _img;
  String? _location;
  String? _createdAt;
  String? _updatedAt;
  int? _typeId;

  Products({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stars,
    String? img,
    String? location,
    String? createdAt,
    String? updatedAt,
    int? typeId,
  }) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (price != null) {
      _price = price;
    }
    if (stars != null) {
      _stars = stars;
    }
    if (img != null) {
      _img = img;
    }
    if (location != null) {
      _location = location;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (typeId != null) {
      _typeId = typeId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get stars => _stars;
  set stars(int? stars) => _stars = stars;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _img = json['img'];
    _location = json['location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['price'] = _price;
    data['stars'] = _stars;
    data['img'] = _img;
    data['location'] = _location;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['type_id'] = _typeId;
    return data;
  }
}
