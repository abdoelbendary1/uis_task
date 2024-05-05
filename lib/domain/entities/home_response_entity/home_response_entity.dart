import 'home_data_entity.dart';

class HomeResponseEntity {
  bool? status;
  dynamic message;
  HomeDataEntity? data;

  HomeResponseEntity({this.status, this.message, this.data});
}
