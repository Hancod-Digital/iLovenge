// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoungesStruct extends BaseStruct {
  LoungesStruct({
    List<CardsStruct>? cards,
    String? timings,
    String? location,
    List<AmenitiesStruct>? amenities,
    int? loungeId,
    String? mobileNo,
    int? ratingAvg,
    String? description,
    bool? is24Hours,
    String? loungeName,
    String? airportCode,
    bool? isFavourite,
    int? ratingCount,
    String? generalEmail,
    List<String>? adminUserIds,
    List<String>? galleryImages,
    String? verticalImage,
    bool? loungeIsActive,
    String? loungeConditions,
    String? loungeCreatedAt,
    String? loungeAdditionalInfo,
  })  : _cards = cards,
        _timings = timings,
        _location = location,
        _amenities = amenities,
        _loungeId = loungeId,
        _mobileNo = mobileNo,
        _ratingAvg = ratingAvg,
        _description = description,
        _is24Hours = is24Hours,
        _loungeName = loungeName,
        _airportCode = airportCode,
        _isFavourite = isFavourite,
        _ratingCount = ratingCount,
        _generalEmail = generalEmail,
        _adminUserIds = adminUserIds,
        _galleryImages = galleryImages,
        _verticalImage = verticalImage,
        _loungeIsActive = loungeIsActive,
        _loungeConditions = loungeConditions,
        _loungeCreatedAt = loungeCreatedAt,
        _loungeAdditionalInfo = loungeAdditionalInfo;

  // "cards" field.
  List<CardsStruct>? _cards;
  List<CardsStruct> get cards => _cards ?? const [];
  set cards(List<CardsStruct>? val) => _cards = val;

  void updateCards(Function(List<CardsStruct>) updateFn) {
    updateFn(_cards ??= []);
  }

  bool hasCards() => _cards != null;

  // "timings" field.
  String? _timings;
  String get timings => _timings ?? '';
  set timings(String? val) => _timings = val;

  bool hasTimings() => _timings != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "amenities" field.
  List<AmenitiesStruct>? _amenities;
  List<AmenitiesStruct> get amenities => _amenities ?? const [];
  set amenities(List<AmenitiesStruct>? val) => _amenities = val;

  void updateAmenities(Function(List<AmenitiesStruct>) updateFn) {
    updateFn(_amenities ??= []);
  }

  bool hasAmenities() => _amenities != null;

  // "lounge_id" field.
  int? _loungeId;
  int get loungeId => _loungeId ?? 0;
  set loungeId(int? val) => _loungeId = val;

  void incrementLoungeId(int amount) => loungeId = loungeId + amount;

  bool hasLoungeId() => _loungeId != null;

  // "mobile_no" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;

  bool hasMobileNo() => _mobileNo != null;

  // "rating_avg" field.
  int? _ratingAvg;
  int get ratingAvg => _ratingAvg ?? 0;
  set ratingAvg(int? val) => _ratingAvg = val;

  void incrementRatingAvg(int amount) => ratingAvg = ratingAvg + amount;

  bool hasRatingAvg() => _ratingAvg != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "is_24_hours" field.
  bool? _is24Hours;
  bool get is24Hours => _is24Hours ?? false;
  set is24Hours(bool? val) => _is24Hours = val;

  bool hasIs24Hours() => _is24Hours != null;

  // "lounge_name" field.
  String? _loungeName;
  String get loungeName => _loungeName ?? '';
  set loungeName(String? val) => _loungeName = val;

  bool hasLoungeName() => _loungeName != null;

  // "airport_code" field.
  String? _airportCode;
  String get airportCode => _airportCode ?? '';
  set airportCode(String? val) => _airportCode = val;

  bool hasAirportCode() => _airportCode != null;

  // "is_favourite" field.
  bool? _isFavourite;
  bool get isFavourite => _isFavourite ?? false;
  set isFavourite(bool? val) => _isFavourite = val;

  bool hasIsFavourite() => _isFavourite != null;

  // "rating_count" field.
  int? _ratingCount;
  int get ratingCount => _ratingCount ?? 0;
  set ratingCount(int? val) => _ratingCount = val;

  void incrementRatingCount(int amount) => ratingCount = ratingCount + amount;

  bool hasRatingCount() => _ratingCount != null;

  // "general_email" field.
  String? _generalEmail;
  String get generalEmail => _generalEmail ?? '';
  set generalEmail(String? val) => _generalEmail = val;

  bool hasGeneralEmail() => _generalEmail != null;

  // "admin_user_ids" field.
  List<String>? _adminUserIds;
  List<String> get adminUserIds => _adminUserIds ?? const [];
  set adminUserIds(List<String>? val) => _adminUserIds = val;

  void updateAdminUserIds(Function(List<String>) updateFn) {
    updateFn(_adminUserIds ??= []);
  }

  bool hasAdminUserIds() => _adminUserIds != null;

  // "gallery_images" field.
  List<String>? _galleryImages;
  List<String> get galleryImages => _galleryImages ?? const [];
  set galleryImages(List<String>? val) => _galleryImages = val;

  void updateGalleryImages(Function(List<String>) updateFn) {
    updateFn(_galleryImages ??= []);
  }

  bool hasGalleryImages() => _galleryImages != null;

  // "vertical_image" field.
  String? _verticalImage;
  String get verticalImage => _verticalImage ?? '';
  set verticalImage(String? val) => _verticalImage = val;

  bool hasVerticalImage() => _verticalImage != null;

  // "lounge_is_active" field.
  bool? _loungeIsActive;
  bool get loungeIsActive => _loungeIsActive ?? false;
  set loungeIsActive(bool? val) => _loungeIsActive = val;

  bool hasLoungeIsActive() => _loungeIsActive != null;

  // "lounge_conditions" field.
  String? _loungeConditions;
  String get loungeConditions => _loungeConditions ?? '';
  set loungeConditions(String? val) => _loungeConditions = val;

  bool hasLoungeConditions() => _loungeConditions != null;

  // "lounge_created_at" field.
  String? _loungeCreatedAt;
  String get loungeCreatedAt => _loungeCreatedAt ?? '';
  set loungeCreatedAt(String? val) => _loungeCreatedAt = val;

  bool hasLoungeCreatedAt() => _loungeCreatedAt != null;

  // "lounge_additional_info" field.
  String? _loungeAdditionalInfo;
  String get loungeAdditionalInfo => _loungeAdditionalInfo ?? '';
  set loungeAdditionalInfo(String? val) => _loungeAdditionalInfo = val;

  bool hasLoungeAdditionalInfo() => _loungeAdditionalInfo != null;

  static LoungesStruct fromMap(Map<String, dynamic> data) => LoungesStruct(
        cards: getStructList(
          data['cards'],
          CardsStruct.fromMap,
        ),
        timings: data['timings'] as String?,
        location: data['location'] as String?,
        amenities: getStructList(
          data['amenities'],
          AmenitiesStruct.fromMap,
        ),
        loungeId: castToType<int>(data['lounge_id']),
        mobileNo: data['mobile_no'] as String?,
        ratingAvg: castToType<int>(data['rating_avg']),
        description: data['description'] as String?,
        is24Hours: data['is_24_hours'] as bool?,
        loungeName: data['lounge_name'] as String?,
        airportCode: data['airport_code'] as String?,
        isFavourite: data['is_favourite'] as bool?,
        ratingCount: castToType<int>(data['rating_count']),
        generalEmail: data['general_email'] as String?,
        adminUserIds: getDataList(data['admin_user_ids']),
        galleryImages: getDataList(data['gallery_images']),
        verticalImage: data['vertical_image'] as String?,
        loungeIsActive: data['lounge_is_active'] as bool?,
        loungeConditions: data['lounge_conditions'] as String?,
        loungeCreatedAt: data['lounge_created_at'] as String?,
        loungeAdditionalInfo: data['lounge_additional_info'] as String?,
      );

  static LoungesStruct? maybeFromMap(dynamic data) =>
      data is Map ? LoungesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cards': _cards?.map((e) => e.toMap()).toList(),
        'timings': _timings,
        'location': _location,
        'amenities': _amenities?.map((e) => e.toMap()).toList(),
        'lounge_id': _loungeId,
        'mobile_no': _mobileNo,
        'rating_avg': _ratingAvg,
        'description': _description,
        'is_24_hours': _is24Hours,
        'lounge_name': _loungeName,
        'airport_code': _airportCode,
        'is_favourite': _isFavourite,
        'rating_count': _ratingCount,
        'general_email': _generalEmail,
        'admin_user_ids': _adminUserIds,
        'gallery_images': _galleryImages,
        'vertical_image': _verticalImage,
        'lounge_is_active': _loungeIsActive,
        'lounge_conditions': _loungeConditions,
        'lounge_created_at': _loungeCreatedAt,
        'lounge_additional_info': _loungeAdditionalInfo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cards': serializeParam(
          _cards,
          ParamType.DataStruct,
          isList: true,
        ),
        'timings': serializeParam(
          _timings,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'amenities': serializeParam(
          _amenities,
          ParamType.DataStruct,
          isList: true,
        ),
        'lounge_id': serializeParam(
          _loungeId,
          ParamType.int,
        ),
        'mobile_no': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'rating_avg': serializeParam(
          _ratingAvg,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'is_24_hours': serializeParam(
          _is24Hours,
          ParamType.bool,
        ),
        'lounge_name': serializeParam(
          _loungeName,
          ParamType.String,
        ),
        'airport_code': serializeParam(
          _airportCode,
          ParamType.String,
        ),
        'is_favourite': serializeParam(
          _isFavourite,
          ParamType.bool,
        ),
        'rating_count': serializeParam(
          _ratingCount,
          ParamType.int,
        ),
        'general_email': serializeParam(
          _generalEmail,
          ParamType.String,
        ),
        'admin_user_ids': serializeParam(
          _adminUserIds,
          ParamType.String,
          isList: true,
        ),
        'gallery_images': serializeParam(
          _galleryImages,
          ParamType.String,
          isList: true,
        ),
        'vertical_image': serializeParam(
          _verticalImage,
          ParamType.String,
        ),
        'lounge_is_active': serializeParam(
          _loungeIsActive,
          ParamType.bool,
        ),
        'lounge_conditions': serializeParam(
          _loungeConditions,
          ParamType.String,
        ),
        'lounge_created_at': serializeParam(
          _loungeCreatedAt,
          ParamType.String,
        ),
        'lounge_additional_info': serializeParam(
          _loungeAdditionalInfo,
          ParamType.String,
        ),
      }.withoutNulls;

  static LoungesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoungesStruct(
        cards: deserializeStructParam<CardsStruct>(
          data['cards'],
          ParamType.DataStruct,
          true,
          structBuilder: CardsStruct.fromSerializableMap,
        ),
        timings: deserializeParam(
          data['timings'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        amenities: deserializeStructParam<AmenitiesStruct>(
          data['amenities'],
          ParamType.DataStruct,
          true,
          structBuilder: AmenitiesStruct.fromSerializableMap,
        ),
        loungeId: deserializeParam(
          data['lounge_id'],
          ParamType.int,
          false,
        ),
        mobileNo: deserializeParam(
          data['mobile_no'],
          ParamType.String,
          false,
        ),
        ratingAvg: deserializeParam(
          data['rating_avg'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        is24Hours: deserializeParam(
          data['is_24_hours'],
          ParamType.bool,
          false,
        ),
        loungeName: deserializeParam(
          data['lounge_name'],
          ParamType.String,
          false,
        ),
        airportCode: deserializeParam(
          data['airport_code'],
          ParamType.String,
          false,
        ),
        isFavourite: deserializeParam(
          data['is_favourite'],
          ParamType.bool,
          false,
        ),
        ratingCount: deserializeParam(
          data['rating_count'],
          ParamType.int,
          false,
        ),
        generalEmail: deserializeParam(
          data['general_email'],
          ParamType.String,
          false,
        ),
        adminUserIds: deserializeParam<String>(
          data['admin_user_ids'],
          ParamType.String,
          true,
        ),
        galleryImages: deserializeParam<String>(
          data['gallery_images'],
          ParamType.String,
          true,
        ),
        verticalImage: deserializeParam(
          data['vertical_image'],
          ParamType.String,
          false,
        ),
        loungeIsActive: deserializeParam(
          data['lounge_is_active'],
          ParamType.bool,
          false,
        ),
        loungeConditions: deserializeParam(
          data['lounge_conditions'],
          ParamType.String,
          false,
        ),
        loungeCreatedAt: deserializeParam(
          data['lounge_created_at'],
          ParamType.String,
          false,
        ),
        loungeAdditionalInfo: deserializeParam(
          data['lounge_additional_info'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LoungesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LoungesStruct &&
        listEquality.equals(cards, other.cards) &&
        timings == other.timings &&
        location == other.location &&
        listEquality.equals(amenities, other.amenities) &&
        loungeId == other.loungeId &&
        mobileNo == other.mobileNo &&
        ratingAvg == other.ratingAvg &&
        description == other.description &&
        is24Hours == other.is24Hours &&
        loungeName == other.loungeName &&
        airportCode == other.airportCode &&
        isFavourite == other.isFavourite &&
        ratingCount == other.ratingCount &&
        generalEmail == other.generalEmail &&
        listEquality.equals(adminUserIds, other.adminUserIds) &&
        listEquality.equals(galleryImages, other.galleryImages) &&
        verticalImage == other.verticalImage &&
        loungeIsActive == other.loungeIsActive &&
        loungeConditions == other.loungeConditions &&
        loungeCreatedAt == other.loungeCreatedAt &&
        loungeAdditionalInfo == other.loungeAdditionalInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cards,
        timings,
        location,
        amenities,
        loungeId,
        mobileNo,
        ratingAvg,
        description,
        is24Hours,
        loungeName,
        airportCode,
        isFavourite,
        ratingCount,
        generalEmail,
        adminUserIds,
        galleryImages,
        verticalImage,
        loungeIsActive,
        loungeConditions,
        loungeCreatedAt,
        loungeAdditionalInfo
      ]);
}

LoungesStruct createLoungesStruct({
  String? timings,
  String? location,
  int? loungeId,
  String? mobileNo,
  int? ratingAvg,
  String? description,
  bool? is24Hours,
  String? loungeName,
  String? airportCode,
  bool? isFavourite,
  int? ratingCount,
  String? generalEmail,
  String? verticalImage,
  bool? loungeIsActive,
  String? loungeConditions,
  String? loungeCreatedAt,
  String? loungeAdditionalInfo,
}) =>
    LoungesStruct(
      timings: timings,
      location: location,
      loungeId: loungeId,
      mobileNo: mobileNo,
      ratingAvg: ratingAvg,
      description: description,
      is24Hours: is24Hours,
      loungeName: loungeName,
      airportCode: airportCode,
      isFavourite: isFavourite,
      ratingCount: ratingCount,
      generalEmail: generalEmail,
      verticalImage: verticalImage,
      loungeIsActive: loungeIsActive,
      loungeConditions: loungeConditions,
      loungeCreatedAt: loungeCreatedAt,
      loungeAdditionalInfo: loungeAdditionalInfo,
    );
