class RouteModifiersDM {
  bool? avoidTolls;
  bool? avoidHighways;
  bool? avoidFerries;

  RouteModifiersDM({
    this.avoidTolls = false,
    this.avoidHighways = false,
    this.avoidFerries = false,
  });

  factory RouteModifiersDM.fromJson(Map<String, dynamic> json) {
    return RouteModifiersDM(
      avoidTolls: json['avoidTolls'] as bool?,
      avoidHighways: json['avoidHighways'] as bool?,
      avoidFerries: json['avoidFerries'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'avoidTolls': avoidTolls,
        'avoidHighways': avoidHighways,
        'avoidFerries': avoidFerries,
      };
}
