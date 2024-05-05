import 'package:e_commerce_app/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';

class AddToCartResponseDm extends AddToCartResponseEntity {
  AddToCartResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    numOfCartItems = json["numOfCartItems"];
    data = json["data"] == null ? null : AddToCartDM.fromJson(json["data"]);
  }
}

class AddToCartDM extends AddToCartEntity {
  AddToCartDM(
      {super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice});

  AddToCartDM.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    products = json["products"] == null
        ? null
        : (json["products"] as List)
            .map((e) => CartProductDM.fromJson(e))
            .toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }
}

class CartProductDM extends CartProductEntity {
  CartProductDM({super.count, super.id, super.product, super.price});

  CartProductDM.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["_id"] = id;
    _data["product"] = product;
    _data["price"] = price;
    return _data;
  }
}
