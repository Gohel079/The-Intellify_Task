import 'package:geolocator/geolocator.dart';

import '../../../model/near_by_location_response_model.dart';


abstract class NearByState {}

class LocationInitialState extends NearByState{}

class LocationLoadingState extends NearByState{}

class LocationLoaded extends NearByState {
  final Position position;
  List<Result> resultList;
  LocationLoaded(this.position,this.resultList);

}

class LocationError extends NearByState {
  final String message;

  LocationError(this.message);

}

