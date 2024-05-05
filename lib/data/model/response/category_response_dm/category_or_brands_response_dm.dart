import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';

class CategoryOrBrandsResponseDm extends CategoryOrBrandsResponseEntity {
  Metadata? metadata;

  CategoryOrBrandsResponseDm({
    super.results,
    this.metadata,
    super.data,
    super.message,
    super.statusMsg,
  });

  CategoryOrBrandsResponseDm.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["message"] is String) {
      results = json["message"];
    }
    if (json["statusMsg"] is String) {
      results = json["statusMsg"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => CategoryOrBrandsDM.fromJson(e))
              .toList();
    }
  }
}

class CategoryOrBrandsDM extends CategoryOrBrandsEntity {
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandsDM(
      {super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  CategoryOrBrandsDM.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if (json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
