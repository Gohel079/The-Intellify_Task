import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intellify_task/model/near_by_location_response_model.dart';
import 'package:intellify_task/model/place_details_response_model.dart';

import 'api.dart';


class ApiRepository {

  API api = API();



  Future<NearByLocationResponse> nearByLocationAPI(Map<String, dynamic> data) async {
    try {
      Response response = await api.sendRequest.get("/nearbysearch/json",
          queryParameters: data);
      if (response.statusCode == 200) {
        print("Near By Location CALLED SUCCESSFULLY");


        dynamic responseData = response.data;

        NearByLocationResponse nearByLocationResponse = NearByLocationResponse.fromJson(responseData);

        return nearByLocationResponse;


        // Map<String, dynamic> responseData = response.data;
        //
        // List<dynamic> results = responseData['results'];
        // print(results.length);
        // print("PRIDFDFD  ${results.first}");
        //
        // // List<Result> resultList = results.map<Result>((dynamic item) {return Result.fromJson(item);}).toList();
        //
        // String placeID = results.isNotEmpty ? results.first['place_id'] as String : "";
        //
        // print("PLACE ID  $placeID");
        //
        // Map<String,dynamic>?  data = {
        //   'fields': 'url,formatted_address,name,geometry,photo,place_id,vicinity,opening_hours,website,reservable,delivery,formatted_phone_number,international_phone_number',
        //   "place_id" : placeID,
        //   "key" : "AIzaSyBJJ6khKjkQArCElTy5h-x_4UljXiG8c7Y"
        // };
        //
        // // String placeID = result?.first.placeId ?? "";
        // if (placeID.isNotEmpty) {
        //   // Call the placeDetailAPI if placeID is not empty
        //   await placeDetailAPI(data);
        // } else {
        //   print("Place ID is empty");
        // }

      } else {
        print("Print Code =${response.statusCode}");
        print("Print Code =${response.data}");

        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    } catch (ex) {
      print("ERROR ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }
  }

  Future<PlaceDetailResponse> placeDetailAPI(Map<String, dynamic> data) async {
    try {
      Response response = await api.sendRequest.get("/details/json",
          queryParameters: data);
      if (response.statusCode == 200) {
        print("Details CALLED SUCCESSFULLY");

        dynamic responseData = response.data;

        PlaceDetailResponse placeDetailResponse = PlaceDetailResponse.fromJson(responseData);

        return  placeDetailResponse;
      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("EROOR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }
  }

  Future<String> getGooglePhotoAPI(Map<String, dynamic> data) async {
    try {
      Response response = await api.sendRequest.get("/photo",
          queryParameters: data);
      if (response.statusCode == 200) {

        dynamic data = response.data;

        return data;

      } else {
        print("Print Code =${response.statusCode}");
        print("Print Code =${response.data}");
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("EROOR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }
  }


}
