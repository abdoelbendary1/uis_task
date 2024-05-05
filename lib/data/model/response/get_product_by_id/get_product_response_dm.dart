import 'package:e_commerce_app/data/model/response/home_response_DM/home_response_dm/product_DM.dart';
import 'package:e_commerce_app/domain/entities/get_product_by_id_entity/get_product_by_id_entity.dart';

class GetProductResponseDm extends GetProductResponseEntity {
  GetProductResponseDm({super.status, super.message, super.data});

  GetProductResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : ProductDM.fromJson(json["data"]);
  }
}
