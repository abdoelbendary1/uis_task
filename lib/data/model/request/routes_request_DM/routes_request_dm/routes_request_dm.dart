import 'destination.dart';
import 'origin.dart';
import 'route_modifiers.dart';

class RoutesRequestDm {
  OriginDM? origin;
  DestinationDM? destination;
  String? travelMode;
  String? routingPreference;
  /* DateTime? departureTime; */
  bool? computeAlternativeRoutes;
  RouteModifiersDM? routeModifiers;
  String? languageCode;
  String? units;

  RoutesRequestDm({
    this.origin,
    this.destination,
    this.travelMode = "DRIVE",
    this.routingPreference = "TRAFFIC_AWARE",
    /* this.departureTime, */
    this.computeAlternativeRoutes = false,
    this.routeModifiers,
    this.languageCode = "en-US",
    this.units ="IMPERIAL",
  });

  factory RoutesRequestDm.fromJson(Map<String, dynamic> json) {
    return RoutesRequestDm(
      origin: json['origin'] == null
          ? null
          : OriginDM.fromJson(json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : DestinationDM.fromJson(json['destination'] as Map<String, dynamic>),
      travelMode: json['travelMode'] as String?,
      routingPreference: json['routingPreference'] as String?,
      /*  departureTime: json['departureTime'] == null
          ? null
          : DateTime.parse(json['departureTime'] as String), */
      computeAlternativeRoutes: json['computeAlternativeRoutes'] as bool?,
      routeModifiers: json['routeModifiers'] == null
          ? null
          : RouteModifiersDM.fromJson(
              json['routeModifiers'] as Map<String, dynamic>),
      languageCode: json['languageCode'] as String?,
      units: json['units'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'origin': origin?.toJson(),
        'destination': destination?.toJson(),
        'travelMode': travelMode,
        'routingPreference': routingPreference,
        /*   'departureTime': departureTime?.toIso8601String(), */
        'computeAlternativeRoutes': computeAlternativeRoutes,
        'routeModifiers': routeModifiers?.toJson(),
        'languageCode': languageCode,
        'units': units,
      };
}
