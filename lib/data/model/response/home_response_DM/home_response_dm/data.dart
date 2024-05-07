import 'package:e_commerce_app/domain/entities/home_response_entity/banner_entity.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/home_data_entity.dart';

import 'banner_Dm.dart';
import 'product_DM.dart';

class HomeData extends HomeDataEntity {
  HomeData({super.banners, super.products, super.ad});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json["banners"] is List) {
      banners = json["banners"] == null
          ? null
          : (json["banners"] as List).map((e) => BannerDM.fromJson(e)).toList();
    }
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => ProductDM.fromJson(e))
              .toList();
    }
    if (json["ad"] is String) {
      ad = json["ad"];
    }
  }
}
