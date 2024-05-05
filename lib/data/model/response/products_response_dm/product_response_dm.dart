/* import 'package:e_commerce_app/data/model/response/category_response_dm/category_or_brands_response_dm.dart';

import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';

class ProductResponseDm extends ProductResponseEntity {
  Metadata? metadata;

  ProductResponseDm({
    super.results,
    this.metadata,
    super.data,
    super.message,
    super.statusMsg,
  });

  ProductResponseDm.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    metadata =
        json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => ProductDM.fromJson(e)).toList();
    message = json['message'] as String?;

    statusMsg = json['statusMsg'] as String?;
  }
}

class ProductDM extends ProductEntity {
  String? createdAt;
  String? updatedAt;

  ProductDM({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDM.fromJson(Map<String, dynamic> json) {
    sold = json["sold"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    subcategory = json["subcategory"] == null
        ? null
        : (json["subcategory"] as List)
            .map((e) => SubcategoryDM.fromJson(e))
            .toList();
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["category"]);
    brand = json["brand"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    id = json["id"];
  }
}

class SubcategoryDM extends SubcategoryEntity {
  SubcategoryDM({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryDM.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    _data["nextPage"] = nextPage;
    return _data;
  }
}
 */