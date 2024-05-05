class BannerEntity {
  int? id;
  String? image;
  /* dynamic category;
  dynamic product; */

  BannerEntity({this.id, this.image, /* this.category, this.product */});

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        id: json['id'] as int?,
        image: json['image'] as String?,
        /* category: json['category'] as dynamic,
        product: json['product'] as dynamic, */
      );
}
