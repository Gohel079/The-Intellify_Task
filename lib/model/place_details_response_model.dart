// To parse this JSON data, do
//
//     final placeDetailResponse = placeDetailResponseFromJson(jsonString);

import 'dart:convert';

PlaceDetailResponse placeDetailResponseFromJson(String str) => PlaceDetailResponse.fromJson(json.decode(str));

String placeDetailResponseToJson(PlaceDetailResponse data) => json.encode(data.toJson());

class PlaceDetailResponse {
  List<dynamic>? htmlAttributions;
  Result? result;
  String? status;

  PlaceDetailResponse({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  PlaceDetailResponse copyWith({
    List<dynamic>? htmlAttributions,
    Result? result,
    String? status,
  }) =>
      PlaceDetailResponse(
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  factory PlaceDetailResponse.fromJson(Map<String, dynamic> json) => PlaceDetailResponse(
    htmlAttributions: json["html_attributions"] == null ? [] : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
    "result": result?.toJson(),
    "status": status,
  };
}

class Result {
  String? formattedAddress;
  Geometry? geometry;
  String? name;
  List<Photo>? photos;
  String? placeId;
  String? url;
  String? vicinity;

  Result({
    this.formattedAddress,
    this.geometry,
    this.name,
    this.photos,
    this.placeId,
    this.url,
    this.vicinity,
  });

  Result copyWith({
    String? formattedAddress,
    Geometry? geometry,
    String? name,
    List<Photo>? photos,
    String? placeId,
    String? url,
    String? vicinity,
  }) =>
      Result(
        formattedAddress: formattedAddress ?? this.formattedAddress,
        geometry: geometry ?? this.geometry,
        name: name ?? this.name,
        photos: photos ?? this.photos,
        placeId: placeId ?? this.placeId,
        url: url ?? this.url,
        vicinity: vicinity ?? this.vicinity,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    formattedAddress: json["formatted_address"],
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    name: json["name"],
    photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
    placeId: json["place_id"],
    url: json["url"],
    vicinity: json["vicinity"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress,
    "geometry": geometry?.toJson(),
    "name": name,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "place_id": placeId,
    "url": url,
    "vicinity": vicinity,
  };
}

class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({
    this.location,
    this.viewport,
  });

  Geometry copyWith({
    Location? location,
    Viewport? viewport,
  }) =>
      Geometry(
        location: location ?? this.location,
        viewport: viewport ?? this.viewport,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "viewport": viewport?.toJson(),
  };
}

class Location {
  double? lat;
  double? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  Viewport copyWith({
    Location? northeast,
    Location? southwest,
  }) =>
      Viewport(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest,
      );

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
    northeast: json["northeast"] == null ? null : Location.fromJson(json["northeast"]),
    southwest: json["southwest"] == null ? null : Location.fromJson(json["southwest"]),
  );

  Map<String, dynamic> toJson() => {
    "northeast": northeast?.toJson(),
    "southwest": southwest?.toJson(),
  };
}

class Photo {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  Photo copyWith({
    int? height,
    List<String>? htmlAttributions,
    String? photoReference,
    int? width,
  }) =>
      Photo(
        height: height ?? this.height,
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        photoReference: photoReference ?? this.photoReference,
        width: width ?? this.width,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    height: json["height"],
    htmlAttributions: json["html_attributions"] == null ? [] : List<String>.from(json["html_attributions"]!.map((x) => x)),
    photoReference: json["photo_reference"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
    "photo_reference": photoReference,
    "width": width,
  };
}
