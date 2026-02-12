// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirportDetailsStruct extends BaseStruct {
  AirportDetailsStruct({
    String? icao,
    String? iata,
    String? name,
    String? city,
    String? region,
    String? country,
    int? elevationFt,
    double? latitude,
    double? longitude,
    String? timezone,
  })  : _icao = icao,
        _iata = iata,
        _name = name,
        _city = city,
        _region = region,
        _country = country,
        _elevationFt = elevationFt,
        _latitude = latitude,
        _longitude = longitude,
        _timezone = timezone;

  // "icao" field.
  String? _icao;
  String get icao => _icao ?? '';
  set icao(String? val) => _icao = val;

  bool hasIcao() => _icao != null;

  // "iata" field.
  String? _iata;
  String get iata => _iata ?? '';
  set iata(String? val) => _iata = val;

  bool hasIata() => _iata != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;

  bool hasRegion() => _region != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "elevation_ft" field.
  int? _elevationFt;
  int get elevationFt => _elevationFt ?? 0;
  set elevationFt(int? val) => _elevationFt = val;

  void incrementElevationFt(int amount) => elevationFt = elevationFt + amount;

  bool hasElevationFt() => _elevationFt != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  set timezone(String? val) => _timezone = val;

  bool hasTimezone() => _timezone != null;

  static AirportDetailsStruct fromMap(Map<String, dynamic> data) =>
      AirportDetailsStruct(
        icao: data['icao'] as String?,
        iata: data['iata'] as String?,
        name: data['name'] as String?,
        city: data['city'] as String?,
        region: data['region'] as String?,
        country: data['country'] as String?,
        elevationFt: castToType<int>(data['elevation_ft']),
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        timezone: data['timezone'] as String?,
      );

  static AirportDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? AirportDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'icao': _icao,
        'iata': _iata,
        'name': _name,
        'city': _city,
        'region': _region,
        'country': _country,
        'elevation_ft': _elevationFt,
        'latitude': _latitude,
        'longitude': _longitude,
        'timezone': _timezone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'icao': serializeParam(
          _icao,
          ParamType.String,
        ),
        'iata': serializeParam(
          _iata,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'elevation_ft': serializeParam(
          _elevationFt,
          ParamType.int,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'timezone': serializeParam(
          _timezone,
          ParamType.String,
        ),
      }.withoutNulls;

  static AirportDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AirportDetailsStruct(
        icao: deserializeParam(
          data['icao'],
          ParamType.String,
          false,
        ),
        iata: deserializeParam(
          data['iata'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        elevationFt: deserializeParam(
          data['elevation_ft'],
          ParamType.int,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        timezone: deserializeParam(
          data['timezone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AirportDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AirportDetailsStruct &&
        icao == other.icao &&
        iata == other.iata &&
        name == other.name &&
        city == other.city &&
        region == other.region &&
        country == other.country &&
        elevationFt == other.elevationFt &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        timezone == other.timezone;
  }

  @override
  int get hashCode => const ListEquality().hash([
        icao,
        iata,
        name,
        city,
        region,
        country,
        elevationFt,
        latitude,
        longitude,
        timezone
      ]);
}

AirportDetailsStruct createAirportDetailsStruct({
  String? icao,
  String? iata,
  String? name,
  String? city,
  String? region,
  String? country,
  int? elevationFt,
  double? latitude,
  double? longitude,
  String? timezone,
}) =>
    AirportDetailsStruct(
      icao: icao,
      iata: iata,
      name: name,
      city: city,
      region: region,
      country: country,
      elevationFt: elevationFt,
      latitude: latitude,
      longitude: longitude,
      timezone: timezone,
    );
