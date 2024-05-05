import 'banner_entity.dart';
import 'product_entity.dart';

class HomeDataEntity {
  List<BannerEntity>? banners;
  List<ProductEntity>? products;
  String? ad;

  HomeDataEntity({this.banners, this.products, this.ad});
}
