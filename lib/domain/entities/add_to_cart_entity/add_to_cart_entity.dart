class AddToCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  AddToCartEntity? data;
  String? statusMsg;

  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.data,
    this.statusMsg,
  });
}

class AddToCartEntity {
  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  AddToCartEntity(
      {this.id,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class CartProductEntity {
  int? count;
  String? id;
  String? product;
  int? price;

  CartProductEntity({this.count, this.id, this.product, this.price});
}
