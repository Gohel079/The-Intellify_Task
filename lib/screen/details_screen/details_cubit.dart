
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellify_task/model/place_details_response_model.dart' as detail;
import '../../network/api_repository.dart';
import 'details_cubtit_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(InitialState());

  List<detail.Photo> detailsPhotoList = [];
  detail.Result resultData = detail.Result();

  goToDetailPage(String placeID) async {

    ApiRepository apiRepository = ApiRepository();
    emit(DetailsLoadingState());

    Map<String,dynamic>?  data = {
      'fields': 'url,formatted_address,name,geometry,photo,place_id,vicinity,opening_hours,website,reservable,delivery,formatted_phone_number,international_phone_number',
      "place_id" : placeID,
      "key" : "AIzaSyBJJ6khKjkQArCElTy5h-x_4UljXiG8c7Y"
    };

   detail.PlaceDetailResponse placeDetailResponse = await apiRepository.placeDetailAPI(data);

   detailsPhotoList = placeDetailResponse.result?.photos ?? [];
    resultData = placeDetailResponse.result ?? detail.Result();
   emit(DetailsLoadedState(detailsPhotoList,resultData));
  }


  Future<String> fetchGoogleImage(String? item) {

    String mData;
    ApiRepository apiRepository = ApiRepository();
    Map<String,dynamic>?  data = {
      'maxWidth': '500',
      "photo_reference" : item,
      "key" : "AIzaSyBJJ6khKjkQArCElTy5h-x_4UljXiG8c7Y"
    };

    return apiRepository.getGooglePhotoAPI(data).then((value) => mData=value);
  }


}