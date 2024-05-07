import 'package:e_commerce_app/presentation/utils/google_maps/cubit/google_maps_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});
  static const String routeName = "googleMapsView";

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  GoogleMapsViewModel viewModel = GoogleMapsViewModel();
  Set<Polyline> polyLines = {};
  @override
  @override
  void initState() {
    super.initState();
    viewModel.initialCameraPosition = const CameraPosition(
      target: LatLng(31.43652571798399, 31.682988215212642),
      zoom: 14,
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.googleMapController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            polylines: polyLines,
            onMapCreated: (controller) {
              viewModel.googleMapController = controller;

              setState(() {
                viewModel.updateCurrentLocation();
              });
            },
            initialCameraPosition: viewModel.initialCameraPosition,
            zoomControlsEnabled: false,
            markers: viewModel.markers,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Expanded(
              child: ElevatedButton(
                  onPressed: () async {
                    /* viewModel
                        .getPoliLinesPoints()
                       .then((points) => generatePolyLinesFromPoints(points)); */
                    var points = await viewModel.getRouteData();
                    displayRoute(points: points);
                  },
                  child: const Text("Go to Product Location")),
            ),
          )
        ],
      ),
    );
  }

  void displayRoute({required List<LatLng> points}) {
    Polyline route = Polyline(
      polylineId: PolylineId("1"),
      color: Colors.blue,
      points: points,
      width: 5,
    );
    polyLines.add(route);
    setState(() {});
  }
}
