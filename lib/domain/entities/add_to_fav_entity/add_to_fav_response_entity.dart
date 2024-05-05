import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class AddToFavResponseEntity {
  bool? status;
  String? message;
  AddToFavoriteData? data;

  AddToFavResponseEntity({this.status, this.message, this.data});
}

class AddToFavoriteData {
  int? id;
  ProductEntity? product;

  AddToFavoriteData({this.id, this.product});
}
