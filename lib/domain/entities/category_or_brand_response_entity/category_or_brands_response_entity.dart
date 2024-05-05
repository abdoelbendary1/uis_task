class CategoryOrBrandsResponseEntity {
  int? results;
  List<CategoryOrBrandsEntity>? data;
  String? statusMsg;
  String? message;

  CategoryOrBrandsResponseEntity({
    this.results,
    this.data,
    this.statusMsg,
    this.message,
  });
}

class CategoryOrBrandsEntity {
  String? id;
  String? name;
  String? slug;
  String? image;

  CategoryOrBrandsEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
