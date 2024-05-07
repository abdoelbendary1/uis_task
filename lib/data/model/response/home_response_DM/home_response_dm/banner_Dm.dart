import 'package:e_commerce_app/domain/entities/home_response_entity/banner_entity.dart';

class BannerDM extends BannerEntity {
  BannerDM({
    super.id,
    super.image,
    /* super.category, super.product */
  });

  factory BannerDM.fromJson(Map<String, dynamic> json) => BannerDM(
        id: json['id'] as int?,
        image: json['image'] as String?,
        /*   category: json['category'] as dynamic,
        product: json['product'] as dynamic, */
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        /*   'category': category,
        'product': product, */
      };
}
