import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intellify_task/model/near_by_location_response_model.dart';
import 'package:intellify_task/nearByLocation/near_by_cubit/near_by_cubit_state.dart';
import 'package:intellify_task/network/api_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class NearByCubit extends Cubit<NearByState>{


  NearByCubit():super(LocationLoadingState()){
    // getCurrentLocation();
  }
  List<Result> resultList = [];
  List<String> photoList = [];
  ApiRepository apiRepository = ApiRepository();

  void getCurrentLocation() async {

    ApiRepository apiRepository = ApiRepository();

    if (await _checkLocationPermission()) {
      try {

        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );



        Map<String,dynamic>?  data = {
          "key" : "AIzaSyBJJ6khKjkQArCElTy5h-x_4UljXiG8c7Y",
          "radius" : "100",
          "location" : "${position.latitude},${position.longitude}",

        };
       NearByLocationResponse neatList = await apiRepository.nearByLocationAPI(data);

        resultList = neatList.results ?? [];

        emit(LocationLoaded(position,resultList));
        print("EMITTING");


      } catch (e) {
        emit(LocationError("Failed to fetch location: $e"));
      }
    } else {
      emit(LocationError("Location permission not granted"));
    }
  }

  Future<bool> _checkLocationPermission() async {
    if (await Permission.location.isGranted) {

      return true;
    } else {
      var status = await Permission.location.request();
      if (status.isGranted) {

        return true;
      } else {
        return false;
      }
    }
  }

  Future<String> fetchGoogleImage(String? item) {

    String mData;
    Map<String,dynamic>?  data = {
      'maxWidth': '500',
      "photo_reference" : item,
      "key" : "AIzaSyBJJ6khKjkQArCElTy5h-x_4UljXiG8c7Y"
    };

   return apiRepository.getGooglePhotoAPI(data).then((value) => mData=value);
  }



}

