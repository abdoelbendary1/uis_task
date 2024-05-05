import 'package:e_commerce_app/data/model/response/home_response_DM/home_response_dm/product_DM.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';

class SearchResponseDm extends SearchResponseEntity {
  SearchResponseDm({super.status, super.message, super.data});

  SearchResponseDm.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : SearchData.fromJson(json["data"]);
  }
}

class SearchData extends SearchDataEntity {
  SearchData({
    super.currentPage,
    super.data,
    super.firstPageUrl,
    super.from,
    super.lastPage,
    super.lastPageUrl,
    super.nextPageUrl,
    super.path,
    super.perPage,
    super.prevPageUrl,
    super.to,
    super.total,
  });

  SearchData.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => ProductDM.fromJson(e)).toList();
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }
}
