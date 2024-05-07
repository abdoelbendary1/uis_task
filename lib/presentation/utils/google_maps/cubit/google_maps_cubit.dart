import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/destination.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/lat_lng.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/location.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/origin.dart';
import 'package:e_commerce_app/data/model/response/routes_response_DM/routes_response_dm/route.dart';
import 'package:e_commerce_app/data/model/response/routes_response_DM/routes_response_dm/routes_response_dm.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'google_maps_state.dart';

class GoogleMapsViewModel extends Cubit<GoogleMapsState> {
  GoogleMapsViewModel() : super(GoogleMapsInitial());

  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  Location location = Location();
  late Set<Marker> markers = {};
  late LatLng currentLocation;
  LatLng productLocation = const LatLng(31.43652571798399, 682988215212642);
  ApiManager apiManager = ApiManager.getInstance();

  /* Future<void> checkServiceEnabled() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      //todo send request
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        //show error
      }
    }
  }

  Future<bool> checkServicePermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void getLocationData() {
    location.onLocationChanged.listen((locationData) {
      var newCameraPosition = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 16);

      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    });
  } */

  /*  void updateLocation() async {
    try {
      await checkServiceEnabled();
      var hasPermission = await checkServicePermission();
      if (hasPermission) {
        getLocation();
      } else {}
    } on Exception catch (e) {
      // TODO
    }
  } */

  void updateCurrentLocation() async {
    var locationData = await getLocation();
    currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    var marker = Marker(
        markerId: const MarkerId("myMarker"),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        visible: true,
        icon: BitmapDescriptor.defaultMarker);
    markers.add(marker);
    googleMapController?.animateCamera(CameraUpdate.newLatLng(currentLocation));
  }

  Future<void> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }

  Future<List<LatLng>> getRouteData() async {
    OriginDM origin = OriginDM(
        location: LocationDM(
            latLng: LatLngDM(
      latitude: currentLocation.latitude,
      longitude: currentLocation.longitude,
    )));
    DestinationDM destination = DestinationDM(
        location: LocationDM(
            latLng: LatLngDM(
      latitude: productLocation.latitude,
      longitude: productLocation.longitude,
    )));
    print(origin.location?.latLng?.latitude);
    var routes = await apiManager.fetchRoutes(
      origin: origin,
      destination: destination,
    );
    print(routes);
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> points = decodeRoute(polylinePoints, routes);
    return points;
  }

  /* Future<List<LatLng>> getPoliLinesPoints() async {
    List<LatLng> polyLinesCordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      ApiConstants.apiKey,
      PointLatLng(31.229857843216887, 29.997199166351727),
      PointLatLng(31.152303186617694, 32.214849002205455),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLinesCordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polyLinesCordinates;
/* 
    /* List<LatLng> points = decodeRoute(polylinePoints, routes); */
    List<PointLatLng> points = polylinePoints
        .decodePolyline(routes!.routes!.first.polyline!.encodedPolyline!); */
  } */

  List<LatLng> decodeRoute(
      PolylinePoints polylinePoints, RoutesResponseDm? routes) {
    List<PointLatLng> result = polylinePoints
        .decodePolyline(routes?.routes?.first.polyline?.encodedPolyline ?? "");
    List<LatLng> points =
        result.map((e) => LatLng(e.latitude, e.longitude)).toList();
    return points;
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
