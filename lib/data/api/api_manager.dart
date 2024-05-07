import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/login_request.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/destination.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/origin.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/route_modifiers.dart';
import 'package:e_commerce_app/data/model/request/routes_request_DM/routes_request_dm/routes_request_dm.dart';
import 'package:e_commerce_app/data/model/request/search_request.dart';
import 'package:e_commerce_app/data/model/request/sign_up_request.dart';
import 'package:e_commerce_app/data/model/response/add_to_fav_dm/add_to_fav_response_dm.dart';

import 'package:e_commerce_app/data/model/response/auth_respnose/Auth_response_DM.dart';
import 'package:e_commerce_app/data/model/response/get_fav_list_response_dm/get_fav_list_response_dm.dart';
import 'package:e_commerce_app/data/model/response/routes_response_DM/routes_response_dm/routes_response_dm.dart';
import 'package:e_commerce_app/data/model/response/get_product_by_id/get_product_response_dm.dart';
import 'package:e_commerce_app/data/model/response/home_response_DM/home_response_dm/home_response_dm.dart';
import 'package:e_commerce_app/data/model/response/search_response_dm/search_response_dm.dart';

import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/search_response_entity/search_response_entity.dart';
import 'package:e_commerce_app/presentation/utils/shared_prefrence.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, AuthResponseDm>> signUp(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        SignUpRequest signUpRequest = SignUpRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
        );
        Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signUpEndPoint);
 var lang = SharedPrefrence.getData(key: "lang");
        var response = await http.post(
          url,
          body: signUpRequest.toJson(),headers: {
          "lang": lang.toString(),
        }
        );
        var signUpResponse = AuthResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          print(signUpResponse.message);
          return right(signUpResponse);
        } else {
          return Left(ServerError(errorMessege: signUpResponse.message!));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, AuthResponseDm>> login(
    String email,
    String password,
  ) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginEndPoint);
        LoginRequest loginRequest =
            LoginRequest(email: email, password: password);

        var lang = SharedPrefrence.getData(key: "lang");

        var response =
            await http.post(url, body: loginRequest.toJson(), headers: {
          "lang": lang.toString(),
        });
        var loginResponse = AuthResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          SharedPrefrence.saveData(
              key: "token", value: loginResponse.data!.token);
          return right(loginResponse);
        } else {
          return left(ServerError(
              errorMessege: loginResponse.data == null
                  ? loginResponse.message!
                  : loginResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, HomeResponseDm>> getHomeData() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.homeEndPoint);

        var response = await http.get(url,
            headers: {"Authorization": token.toString(), "lang": "en"});
        var homeResponse = HomeResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(homeResponse);
        } else if (response.statusCode == 401) {
          return Left(
              ServerError(errorMessege: homeResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(errorMessege: homeResponse.message));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, GetProductResponseDm>> getProductByID(
      String productID) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url = Uri.https(ApiConstants.baseUrl,
            "${ApiConstants.productsEndPoint}/$productID");

        var response = await http.get(url,
            headers: {"Authorization": token.toString(), "lang": "en"});
        var productResponse =
            GetProductResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(productResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(
              errorMessege: productResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: productResponse.message ?? "Server Error"));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, GetFavListResponseDm>> getFavoriteListData() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.favoriteListEndPoint);

        var response = await http.get(url,
            headers: {"Authorization": token.toString(), "lang": "en"});
        var favListResponse =
            GetFavListResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(favListResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(
              errorMessege: favListResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: favListResponse.message ?? "Server Error"));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, SearchResponseEntity>> searchProducts(
    String searchText,
  ) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var url = Uri.https(ApiConstants.baseUrl, ApiConstants.searchEndPoint);
        var searchRequest = SearchRequest(searchText: searchText);

        var lang = SharedPrefrence.getData(key: "lang");

        var response =
            await http.post(url, body: searchRequest.toJson(), headers: {
          "lang": "en",
        });
        var searchResponse =
            SearchResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode <= 300) {
          return right(searchResponse);
        } else {
          return left(ServerError(
              errorMessege: searchResponse.data == null
                  ? "Server Error"
                  : searchResponse.message!));
        }
      } else {
        return left(
            NetworkError(errorMessege: "check your internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<Either<Failures, AddToFavResponseDm>> addToFavorite(
      String productID) async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var token = SharedPrefrence.getData(key: "token");
        Uri url =
            Uri.https(ApiConstants.baseUrl, ApiConstants.addToFavoriteEndPoint);

        var response = await http.post(url, body: {
          "product_id": productID,
        }, headers: {
          "Authorization": token.toString(),
          "lang": "en",
        });
        var addToFavResponse =
            AddToFavResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(addToFavResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(
              errorMessege: addToFavResponse.message ?? "Error 401"));
        } else {
          return left(ServerError(
              errorMessege: addToFavResponse.message ?? "Server Error"));
        }
      } else {
        // no internet connection
        return Left(NetworkError(
            errorMessege: "no internet connection , check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorMessege: e.toString()));
    }
  }

  Future<RoutesResponseDm?> fetchRoutes({
    required OriginDM origin,
    required DestinationDM destination,
    RouteModifiersDM? routesModifiers,
  }) async {
    try {
      Uri url = Uri.parse(ApiConstants.routesBaseUrl);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': ApiConstants.apiKey,
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
      };

      var requestBody = RoutesRequestDm(
        origin: origin,
        destination: destination,
        routeModifiers: routesModifiers,
      );

      var response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print("sent");
        return RoutesResponseDm.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
      }
    } on Exception catch (e) {
      // TODO
      print("error is ${e.toString()}");
    }
  }
}
