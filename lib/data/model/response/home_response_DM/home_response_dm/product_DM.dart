import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';

class ProductDM extends ProductEntity {
  ProductDM({
    super.id,
    super.price,
    super.oldPrice,
    super.discount,
    super.image,
    super.name,
    super.description,
    super.images,
    super.inFavorites,
    super.inCart,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) => ProductDM(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        oldPrice: (json['old_price'] as num?)?.toDouble(),
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };
}
