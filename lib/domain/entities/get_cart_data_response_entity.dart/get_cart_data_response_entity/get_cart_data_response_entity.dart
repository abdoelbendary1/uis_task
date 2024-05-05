import 'CartDataEntity.dart';

class GetCartDataResponseEntity {
  String? status;
  int? numOfCartItems;
  String? message;

  String? statusMsg;

  GetCartDataResponseEntity({
    this.status,
    this.numOfCartItems,
    this.message,
    this.statusMsg,
  });
}
