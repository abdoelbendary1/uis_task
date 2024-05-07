import 'route.dart';

class RoutesResponseDm {
  List<RouteDM>? routes;

  RoutesResponseDm({this.routes});

  factory RoutesResponseDm.fromJson(Map<String, dynamic> json) {
    return RoutesResponseDm(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RouteDM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'routes': routes?.map((e) => e.toJson()).toList(),
      };
}
