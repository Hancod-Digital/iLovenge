// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoungesViewStruct extends BaseStruct {
  LoungesViewStruct({
    List<CardsInLoungViewStruct>? cards,
    int? loungeId,
    DateTime? loungeCreatedAt,
    bool? loungeIsActive,
    String? loungeName,
    String? location,
    String? airportCode,
    String? description,
    String? verticalImage,
    List<String>? galleryImages,
    String? mobileNo,
    String? generalEmail,
    bool? is24Hours,
    String? loungeConditions,
    String? loungeAdditionalInfo,
    bool? isFavourite,
    int? ratingCount,
    double? ratingAvg,
  })  : _cards = cards,
        _loungeId = loungeId,
        _loungeCreatedAt = loungeCreatedAt,
        _loungeIsActive = loungeIsActive,
        _loungeName = loungeName,
        _location = location,
        _airportCode = airportCode,
        _description = description,
        _verticalImage = verticalImage,
        _galleryImages = galleryImages,
        _mobileNo = mobileNo,
        _generalEmail = generalEmail,
        _is24Hours = is24Hours,
        _loungeConditions = loungeConditions,
        _loungeAdditionalInfo = loungeAdditionalInfo,
        _isFavourite = isFavourite,
        _ratingCount = ratingCount,
        _ratingAvg = ratingAvg;

  // "cards" field.
  List<CardsInLoungViewStruct>? _cards;
  List<CardsInLoungViewStruct> get cards => _cards ?? const [];
  set cards(List<CardsInLoungViewStruct>? val) => _cards = val;

  void updateCards(Function(List<CardsInLoungViewStruct>) updateFn) {
    updateFn(_cards ??= []);
  }

  bool hasCards() => _cards != null;

  // "lounge_id" field.
  int? _loungeId;
  int get loungeId => _loungeId ?? 0;
  set loungeId(int? val) => _loungeId = val;

  void incrementLoungeId(int amount) => loungeId = loungeId + amount;

  bool hasLoungeId() => _loungeId != null;

  // "lounge_created_at" field.
  DateTime? _loungeCreatedAt;
  DateTime? get loungeCreatedAt => _loungeCreatedAt;
  set loungeCreatedAt(DateTime? val) => _loungeCreatedAt = val;

  bool hasLoungeCreatedAt() => _loungeCreatedAt != null;

  // "lounge_is_active" field.
  bool? _loungeIsActive;
  bool get loungeIsActive => _loungeIsActive ?? false;
  set loungeIsActive(bool? val) => _loungeIsActive = val;

  bool hasLoungeIsActive() => _loungeIsActive != null;

  // "lounge_name" field.
  String? _loungeName;
  String get loungeName => _loungeName ?? '';
  set loungeName(String? val) => _loungeName = val;

  bool hasLoungeName() => _loungeName != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "airport_code" field.
  String? _airportCode;
  String get airportCode => _airportCode ?? '';
  set airportCode(String? val) => _airportCode = val;

  bool hasAirportCode() => _airportCode != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "vertical_image" field.
  String? _verticalImage;
  String get verticalImage => _verticalImage ?? '';
  set verticalImage(String? val) => _verticalImage = val;

  bool hasVerticalImage() => _verticalImage != null;

  // "gallery_images" field.
  List<String>? _galleryImages;
  List<String> get galleryImages => _galleryImages ?? const [];
  set galleryImages(List<String>? val) => _galleryImages = val;

  void updateGalleryImages(Function(List<String>) updateFn) {
    updateFn(_galleryImages ??= []);
  }

  bool hasGalleryImages() => _galleryImages != null;

  // "mobile_no" field.
  String? _mobileNo;
  String get mobileNo => _mobileNo ?? '';
  set mobileNo(String? val) => _mobileNo = val;

  bool hasMobileNo() => _mobileNo != null;

  // "general_email" field.
  String? _generalEmail;
  String get generalEmail => _generalEmail ?? '';
  set generalEmail(String? val) => _generalEmail = val;

  bool hasGeneralEmail() => _generalEmail != null;

  // "is_24_hours" field.
  bool? _is24Hours;
  bool get is24Hours => _is24Hours ?? false;
  set is24Hours(bool? val) => _is24Hours = val;

  bool hasIs24Hours() => _is24Hours != null;

  // "lounge_conditions" field.
  String? _loungeConditions;
  String get loungeConditions => _loungeConditions ?? '';
  set loungeConditions(String? val) => _loungeConditions = val;

  bool hasLoungeConditions() => _loungeConditions != null;

  // "lounge_additional_info" field.
  String? _loungeAdditionalInfo;
  String get loungeAdditionalInfo => _loungeAdditionalInfo ?? '';
  set loungeAdditionalInfo(String? val) => _loungeAdditionalInfo = val;

  bool hasLoungeAdditionalInfo() => _loungeAdditionalInfo != null;

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

  // "rating_avg" field.
  double? _ratingAvg;
  double get ratingAvg => _ratingAvg ?? 0.0;
  set ratingAvg(double? val) => _ratingAvg = val;

  void incrementRatingAvg(double amount) => ratingAvg = ratingAvg + amount;

  bool hasRatingAvg() => _ratingAvg != null;

  static LoungesViewStruct fromMap(Map<String, dynamic> data) =>
      LoungesViewStruct(
        cards: getStructList(
          data['cards'],
          CardsInLoungViewStruct.fromMap,
        ),
        loungeId: castToType<int>(data['lounge_id']),
        loungeCreatedAt: data['lounge_created_at'] as DateTime?,
        loungeIsActive: data['lounge_is_active'] as bool?,
        loungeName: data['lounge_name'] as String?,
        location: data['location'] as String?,
        airportCode: data['airport_code'] as String?,
        description: data['description'] as String?,
        verticalImage: data['vertical_image'] as String?,
        galleryImages: getDataList(data['gallery_images']),
        mobileNo: data['mobile_no'] as String?,
        generalEmail: data['general_email'] as String?,
        is24Hours: data['is_24_hours'] as bool?,
        loungeConditions: data['lounge_conditions'] as String?,
        loungeAdditionalInfo: data['lounge_additional_info'] as String?,
        isFavourite: data['is_favourite'] as bool?,
        ratingCount: castToType<int>(data['rating_count']),
        ratingAvg: castToType<double>(data['rating_avg']),
      );

  static LoungesViewStruct? maybeFromMap(dynamic data) => data is Map
      ? LoungesViewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cards': _cards?.map((e) => e.toMap()).toList(),
        'lounge_id': _loungeId,
        'lounge_created_at': _loungeCreatedAt,
        'lounge_is_active': _loungeIsActive,
        'lounge_name': _loungeName,
        'location': _location,
        'airport_code': _airportCode,
        'description': _description,
        'vertical_image': _verticalImage,
        'gallery_images': _galleryImages,
        'mobile_no': _mobileNo,
        'general_email': _generalEmail,
        'is_24_hours': _is24Hours,
        'lounge_conditions': _loungeConditions,
        'lounge_additional_info': _loungeAdditionalInfo,
        'is_favourite': _isFavourite,
        'rating_count': _ratingCount,
        'rating_avg': _ratingAvg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cards': serializeParam(
          _cards,
          ParamType.DataStruct,
          isList: true,
        ),
        'lounge_id': serializeParam(
          _loungeId,
          ParamType.int,
        ),
        'lounge_created_at': serializeParam(
          _loungeCreatedAt,
          ParamType.DateTime,
        ),
        'lounge_is_active': serializeParam(
          _loungeIsActive,
          ParamType.bool,
        ),
        'lounge_name': serializeParam(
          _loungeName,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'airport_code': serializeParam(
          _airportCode,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'vertical_image': serializeParam(
          _verticalImage,
          ParamType.String,
        ),
        'gallery_images': serializeParam(
          _galleryImages,
          ParamType.String,
          isList: true,
        ),
        'mobile_no': serializeParam(
          _mobileNo,
          ParamType.String,
        ),
        'general_email': serializeParam(
          _generalEmail,
          ParamType.String,
        ),
        'is_24_hours': serializeParam(
          _is24Hours,
          ParamType.bool,
        ),
        'lounge_conditions': serializeParam(
          _loungeConditions,
          ParamType.String,
        ),
        'lounge_additional_info': serializeParam(
          _loungeAdditionalInfo,
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
        'rating_avg': serializeParam(
          _ratingAvg,
          ParamType.double,
        ),
      }.withoutNulls;

  static LoungesViewStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoungesViewStruct(
        cards: deserializeStructParam<CardsInLoungViewStruct>(
          data['cards'],
          ParamType.DataStruct,
          true,
          structBuilder: CardsInLoungViewStruct.fromSerializableMap,
        ),
        loungeId: deserializeParam(
          data['lounge_id'],
          ParamType.int,
          false,
        ),
        loungeCreatedAt: deserializeParam(
          data['lounge_created_at'],
          ParamType.DateTime,
          false,
        ),
        loungeIsActive: deserializeParam(
          data['lounge_is_active'],
          ParamType.bool,
          false,
        ),
        loungeName: deserializeParam(
          data['lounge_name'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        airportCode: deserializeParam(
          data['airport_code'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        verticalImage: deserializeParam(
          data['vertical_image'],
          ParamType.String,
          false,
        ),
        galleryImages: deserializeParam<String>(
          data['gallery_images'],
          ParamType.String,
          true,
        ),
        mobileNo: deserializeParam(
          data['mobile_no'],
          ParamType.String,
          false,
        ),
        generalEmail: deserializeParam(
          data['general_email'],
          ParamType.String,
          false,
        ),
        is24Hours: deserializeParam(
          data['is_24_hours'],
          ParamType.bool,
          false,
        ),
        loungeConditions: deserializeParam(
          data['lounge_conditions'],
          ParamType.String,
          false,
        ),
        loungeAdditionalInfo: deserializeParam(
          data['lounge_additional_info'],
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
        ratingAvg: deserializeParam(
          data['rating_avg'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LoungesViewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LoungesViewStruct &&
        listEquality.equals(cards, other.cards) &&
        loungeId == other.loungeId &&
        loungeCreatedAt == other.loungeCreatedAt &&
        loungeIsActive == other.loungeIsActive &&
        loungeName == other.loungeName &&
        location == other.location &&
        airportCode == other.airportCode &&
        description == other.description &&
        verticalImage == other.verticalImage &&
        listEquality.equals(galleryImages, other.galleryImages) &&
        mobileNo == other.mobileNo &&
        generalEmail == other.generalEmail &&
        is24Hours == other.is24Hours &&
        loungeConditions == other.loungeConditions &&
        loungeAdditionalInfo == other.loungeAdditionalInfo &&
        isFavourite == other.isFavourite &&
        ratingCount == other.ratingCount &&
        ratingAvg == other.ratingAvg;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cards,
        loungeId,
        loungeCreatedAt,
        loungeIsActive,
        loungeName,
        location,
        airportCode,
        description,
        verticalImage,
        galleryImages,
        mobileNo,
        generalEmail,
        is24Hours,
        loungeConditions,
        loungeAdditionalInfo,
        isFavourite,
        ratingCount,
        ratingAvg
      ]);
}

LoungesViewStruct createLoungesViewStruct({
  int? loungeId,
  DateTime? loungeCreatedAt,
  bool? loungeIsActive,
  String? loungeName,
  String? location,
  String? airportCode,
  String? description,
  String? verticalImage,
  String? mobileNo,
  String? generalEmail,
  bool? is24Hours,
  String? loungeConditions,
  String? loungeAdditionalInfo,
  bool? isFavourite,
  int? ratingCount,
  double? ratingAvg,
}) =>
    LoungesViewStruct(
      loungeId: loungeId,
      loungeCreatedAt: loungeCreatedAt,
      loungeIsActive: loungeIsActive,
      loungeName: loungeName,
      location: location,
      airportCode: airportCode,
      description: description,
      verticalImage: verticalImage,
      mobileNo: mobileNo,
      generalEmail: generalEmail,
      is24Hours: is24Hours,
      loungeConditions: loungeConditions,
      loungeAdditionalInfo: loungeAdditionalInfo,
      isFavourite: isFavourite,
      ratingCount: ratingCount,
      ratingAvg: ratingAvg,
    );
