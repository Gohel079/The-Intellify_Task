import 'package:intellify_task/model/place_details_response_model.dart';

abstract class DetailsState {}

class DetailsLoadingState extends DetailsState{}

class InitialState extends DetailsState{}

class DetailsLoadedState extends DetailsState{
  Result result;
  List<Photo> photo;
  DetailsLoadedState(this.photo,this.result);
}

class NavigateToDetails extends DetailsState {}
