import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class SearchResponseEntity {
  bool? status;
  dynamic message;
  SearchDataEntity? data;

  SearchResponseEntity({this.status, this.message, this.data});
}

class SearchDataEntity {
  int? currentPage;
  List<ProductEntity>? data;
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

  SearchDataEntity(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});
}
