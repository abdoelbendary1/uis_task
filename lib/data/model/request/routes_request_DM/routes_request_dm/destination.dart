import 'location.dart';

class DestinationDM {
  LocationDM? location;

  DestinationDM({this.location});

  factory DestinationDM.fromJson(Map<String, dynamic> json) => DestinationDM(
        location: json['location'] == null
            ? null
            : LocationDM.fromJson(json['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
      };
}
