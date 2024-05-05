import 'package:e_commerce_app/data/model/response/home_response_DM/home_response_dm/product_DM.dart';
import 'package:e_commerce_app/domain/entities/add_to_fav_entity/add_to_fav_response_entity.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class AddToFavResponseDm extends AddToFavResponseEntity {
  AddToFavResponseDm({super.status, super.message, super.data});

  AddToFavResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : AddToFavoriteDM.fromJson(json["data"]);
  }
}

class AddToFavoriteDM extends AddToFavoriteData {
  AddToFavoriteDM({super.id, super.product});

  AddToFavoriteDM.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product =
        json["product"] == null ? null : ProductDM.fromJson(json["product"]);
  }
}
