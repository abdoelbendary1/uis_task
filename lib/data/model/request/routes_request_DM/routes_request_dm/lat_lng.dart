class LatLngDM {
  double? latitude;
  double? longitude;

  LatLngDM({this.latitude, this.longitude});

  factory LatLngDM.fromJson(Map<String, dynamic> json) => LatLngDM(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
