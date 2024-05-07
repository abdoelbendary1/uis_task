import 'lat_lng.dart';

class LocationDM {
  LatLngDM? latLng;

  LocationDM({this.latLng});

  factory LocationDM.fromJson(Map<String, dynamic> json) => LocationDM(
        latLng: json['latLng'] == null
            ? null
            : LatLngDM.fromJson(json['latLng'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latLng': latLng?.toJson(),
      };
}
