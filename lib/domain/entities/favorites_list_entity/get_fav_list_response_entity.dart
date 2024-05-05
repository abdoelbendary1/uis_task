
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class GetFavTabResponseEntity {
  bool? status;
  dynamic message;
  FavTabEntity? data;

  GetFavTabResponseEntity({this.status, this.message, this.data});

  
}

class FavTabEntity {
  int? currentPage;
  List<FavListEntity>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  FavTabEntity({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

 

 
}

class FavListEntity {
  int? id;
  ProductEntity? product;

  FavListEntity({this.id, this.product});

  
}

