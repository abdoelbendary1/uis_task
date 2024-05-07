import 'location.dart';

class OriginDM {
  LocationDM? location;

  OriginDM({this.location});

  factory OriginDM.fromJson(Map<String, dynamic> json) => OriginDM(
        location: json['location'] == null
            ? null
            : LocationDM.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}
