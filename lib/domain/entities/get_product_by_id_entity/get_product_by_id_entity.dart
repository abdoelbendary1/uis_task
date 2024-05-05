import 'package:e_commerce_app/data/model/response/home_response_DM/home_response_dm/product_DM.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class GetProductResponseEntity {
  bool? status;
  dynamic message;
  ProductEntity? data;

  GetProductResponseEntity({this.status, this.message, this.data});
}
