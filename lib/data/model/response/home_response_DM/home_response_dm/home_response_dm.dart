import 'package:e_commerce_app/domain/entities/home_response_entity/home_response_entity.dart';

import 'data.dart';

class HomeResponseDm extends HomeResponseEntity {
  HomeResponseDm({super.status, super.message, super.data});

  factory HomeResponseDm.fromJson(Map<String, dynamic> json) {
    return HomeResponseDm(
      status: json['status'] as bool?,
      message: json['message'] as dynamic,
      data: json['data'] == null
          ? null
          : HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
