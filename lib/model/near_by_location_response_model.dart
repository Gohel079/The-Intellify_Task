// To parse this JSON data, do
//
//     final nearByLocationResponse = nearByLocationResponseFromJson(jsonString);

import 'dart:convert';

NearByLocationResponse nearByLocationResponseFromJson(String str) => NearByLocationResponse.fromJson(json.decode(str));

String nearByLocationResponseToJson(NearByLocationResponse data) => json.encode(data.toJson());

class NearByLocationResponse {
  List<dynamic>? htmlAttributions;
  String? nextPageToken;
  List<Result>? results;
  String? status;

  NearByLocationResponse({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
    this.status,
  });

  NearByLocationResponse copyWith({
    List<dynamic>? htmlAttributions,
    String? nextPageToken,
    List<Result>? results,
    String? status,
  }) =>
      NearByLocationResponse(
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        results: results ?? this.results,
        status: status ?? this.status,
      );

  factory NearByLocationResponse.fromJson(Map<String, dynamic> json) => NearByLocationResponse(
    htmlAttributions: json["html_attributions"] == null ? [] : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
    nextPageToken: json["next_page_token"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions == null ? [] : List<dynamic>.from(htmlAttributions!.map((x) => x)),
    "next_page_token": nextPageToken,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "status": status,
  };
}

class Result {
  Geometry? geometry;
  String? icon;
  IconBackgroundColor? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  List<Photo>? photos;
  String? placeId;
  String? reference;
  Scope? scope;
  List<String>? types;
  String? vicinity;
  String? businessStatus;
  OpeningHours? openingHours;
  PlusCode? plusCode;
  double? rating;
  int? userRatingsTotal;
  int? priceLevel;

  Result({
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.photos,
    this.placeId,
    this.reference,
    this.scope,
    this.types,
    this.vicinity,
    this.businessStatus,
    this.openingHours,
    this.plusCode,
    this.rating,
    this.userRatingsTotal,
    this.priceLevel,
  });

  Result copyWith({
    Geometry? geometry,
    String? icon,
    IconBackgroundColor? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? name,
    List<Photo>? photos,
    String? placeId,
    String? reference,
    Scope? scope,
    List<String>? types,
    String? vicinity,
    String? businessStatus,
    OpeningHours? openingHours,
    PlusCode? plusCode,
    double? rating,
    int? userRatingsTotal,
    int? priceLevel,
  }) =>
      Result(
        geometry: geometry ?? this.geometry,
        icon: icon ?? this.icon,
        iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
        iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
        name: name ?? this.name,
        photos: photos ?? this.photos,
        placeId: placeId ?? this.placeId,
        reference: reference ?? this.reference,
        scope: scope ?? this.scope,
        types: types ?? this.types,
        vicinity: vicinity ?? this.vicinity,
        businessStatus: businessStatus ?? this.businessStatus,
        openingHours: openingHours ?? this.openingHours,
        plusCode: plusCode ?? this.plusCode,
        rating: rating ?? this.rating,
        userRatingsTotal: userRatingsTotal ?? this.userRatingsTotal,
        priceLevel: priceLevel ?? this.priceLevel,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    icon: json["icon"],
    iconBackgroundColor: iconBackgroundColorValues.map[json["icon_background_color"]]!,
    iconMaskBaseUri: json["icon_mask_base_uri"],
    name: json["name"],
    photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
    placeId: json["place_id"],
    reference: json["reference"],
    scope: scopeValues.map[json["scope"]]!,
    types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
    vicinity: json["vicinity"] ?? "",
    businessStatus: json["business_status"] ?? "",
    openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
    plusCode: json["plus_code"] == null ? null : PlusCode.fromJson(json["plus_code"]),
    rating: json["rating"]?.toDouble(),
    userRatingsTotal: json["user_ratings_total"],
    priceLevel: json["price_level"],
  );

  Map<String, dynamic> toJson() => {
    "geometry": geometry?.toJson(),
    "icon": icon,
    "icon_background_color": iconBackgroundColorValues.reverse[iconBackgroundColor],
    "icon_mask_base_uri": iconMaskBaseUri,
    "name": name,
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "place_id": placeId,
    "reference": reference,
    "scope": scopeValues.reverse[scope],
    "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
    "vicinity": vicinity ?? "",
    "business_status": businessStatus,
    "opening_hours": openingHours?.toJson(),
    "plus_code": plusCode?.toJson(),
    "rating": rating,
    "user_ratings_total": userRatingsTotal,
    "price_level": priceLevel,
  };
}

enum BusinessStatus {
  OPERATIONAL
}

final businessStatusValues = EnumValues({
  "OPERATIONAL": BusinessStatus.OPERATIONAL
});

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

enum IconBackgroundColor {
  FF9_E67,
  THE_13_B5_C7,
  THE_4_B96_F3,
  THE_7_B9_EB0
}

final iconBackgroundColorValues = EnumValues({
  "#FF9E67": IconBackgroundColor.FF9_E67,
  "#13B5C7": IconBackgroundColor.THE_13_B5_C7,
  "#4B96F3": IconBackgroundColor.THE_4_B96_F3,
  "#7B9EB0": IconBackgroundColor.THE_7_B9_EB0
});

class OpeningHours {
  bool? openNow;

  OpeningHours({
    this.openNow,
  });

  OpeningHours copyWith({
    bool? openNow,
  }) =>
      OpeningHours(
        openNow: openNow ?? this.openNow,
      );

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    openNow: json["open_now"],
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow,
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

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  PlusCode copyWith({
    String? compoundCode,
    String? globalCode,
  }) =>
      PlusCode(
        compoundCode: compoundCode ?? this.compoundCode,
        globalCode: globalCode ?? this.globalCode,
      );

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
    compoundCode: json["compound_code"],
    globalCode: json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "compound_code": compoundCode,
    "global_code": globalCode,
  };
}

enum Scope {
  GOOGLE
}

final scopeValues = EnumValues({
  "GOOGLE": Scope.GOOGLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
