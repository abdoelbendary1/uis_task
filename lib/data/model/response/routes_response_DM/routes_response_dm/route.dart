import 'polyline.dart';

class RouteDM {
  int? distanceMeters;
  String? duration;
  Polyline? polyline;

  RouteDM({this.distanceMeters, this.duration, this.polyline});

  factory RouteDM.fromJson(Map<String, dynamic> json) => RouteDM(
        distanceMeters: json['distanceMeters'] as int?,
        duration: json['duration'] as String?,
        polyline: json['polyline'] == null
            ? null
            : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'distanceMeters': distanceMeters,
        'duration': duration,
        'polyline': polyline?.toJson(),
      };
}
