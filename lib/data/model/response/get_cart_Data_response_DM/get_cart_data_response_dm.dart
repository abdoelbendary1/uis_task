/* import 'package:e_commerce_app/data/model/response/category_response_dm/category_or_brands_response_dm.dart';
import 'package:e_commerce_app/data/model/response/products_response_dm/product_response_dm.dart';

import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/CartDataEntity.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/CartProductEntity.dart';
import 'package:e_commerce_app/domain/entities/get_cart_data_response_entity.dart/get_cart_data_response_entity/get_cart_data_response_entity.dart';
import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';

class GetCartDataResponseDm extends GetCartDataResponseEntity {
  GetCartDataResponseDm({
    super.status,
    super.numOfCartItems,
    super.data,
  });

  GetCartDataResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    numOfCartItems = json["numOfCartItems"];
    data = json["data"] == null ? null : CartDataDM.fromJson(json["data"]);
  }
}

class CartDataDM extends CartDataEntity {
  CartDataDM(
      {super.id,
      super.cartOwner,
      super.products,
      /*  super.createdAt,
      super.updatedAt, */
      super.v,
      super.totalCartPrice});

  CartDataDM.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null
        ? null
        : (json["products"] as List)
            .map((e) => GetCartProductsDm.fromJson(e))
            .toList();
    /* createdAt = json["createdAt"];
    updatedAt = json["updatedAt"]; */
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }
}

class GetCartProductsDm extends GetCartProductEntity {
  GetCartProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDm.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product =
        json["product"] == null ? null : ProductDM.fromJson(json["product"]);
    price = json["price"];
  }
}

class GetCartProductDM extends ProductEntity {
  GetCartProductDM({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetCartProductDM.fromJson(Map<String, dynamic> json) {
    subcategory = json["subcategory"] == null
        ? null
        : (json["subcategory"] as List)
            .map((e) => SubcategoryDM.fromJson(e))
            .toList();
    id = json["_id"];
    title = json["title"];
    quantity = json["quantity"];
    imageCover = json["imageCover"];
    category = json["category"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["category"]);
    brand = json["brand"] == null
        ? null
        : CategoryOrBrandsDM.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    id = json["id"];
  }
}
 */