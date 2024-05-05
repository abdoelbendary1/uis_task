
class HomeDataDm {
  bool? status;
  dynamic message;
  Data? data;

  HomeDataDm({this.status, this.message, this.data});

  HomeDataDm.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    message = json["message"];
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["banners"] is List) {
      banners = json["banners"] == null ? null : (json["banners"] as List).map((e) => Banners.fromJson(e)).toList();
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["ad"] is String) {
      ad = json["ad"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(banners != null) {
      _data["banners"] = banners?.map((e) => e.toJson()).toList();
    }
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["ad"] = ad;
    return _data;
  }
}

class Products {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products({this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description, this.images, this.inFavorites, this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["old_price"] is int) {
      oldPrice = json["old_price"];
    }
    if(json["discount"] is int) {
      discount = json["discount"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["in_favorites"] is bool) {
      inFavorites = json["in_favorites"];
    }
    if(json["in_cart"] is bool) {
      inCart = json["in_cart"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["price"] = price;
    _data["old_price"] = oldPrice;
    _data["discount"] = discount;
    _data["image"] = image;
    _data["name"] = name;
    _data["description"] = description;
    if(images != null) {
      _data["images"] = images;
    }
    _data["in_favorites"] = inFavorites;
    _data["in_cart"] = inCart;
    return _data;
  }
}

class Banners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    category = json["category"];
    product = json["product"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["category"] = category;
    _data["product"] = product;
    return _data;
  }
}