// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirportDataViewStruct extends BaseStruct {
  AirportDataViewStruct({
    String? airportId,
    String? iataCode,
    String? icaoCode,
    String? airportName,
    String? city,
    String? country,
    double? latitude,
    double? longitude,
    String? airportTimezone,
    String? countryCode,
    String? countryTimezone,
    String? createdAt,
    String? updatedAt,
    String? countryTimezoneId,
  })  : _airportId = airportId,
        _iataCode = iataCode,
        _icaoCode = icaoCode,
        _airportName = airportName,
        _city = city,
        _country = country,
        _latitude = latitude,
        _longitude = longitude,
        _airportTimezone = airportTimezone,
        _countryCode = countryCode,
        _countryTimezone = countryTimezone,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _countryTimezoneId = countryTimezoneId;

  // "airport_id" field.
  String? _airportId;
  String get airportId => _airportId ?? '';
  set airportId(String? val) => _airportId = val;
  bool hasAirportId() => _airportId != null;

  // "iata_code" field.
  String? _iataCode;
  String get iataCode => _iataCode ?? '';
  set iataCode(String? val) => _iataCode = val;
  bool hasIataCode() => _iataCode != null;

  // "icao_code" field.
  String? _icaoCode;
  String get icaoCode => _icaoCode ?? '';
  set icaoCode(String? val) => _icaoCode = val;
  bool hasIcaoCode() => _icaoCode != null;

  // "airport_name" field.
  String? _airportName;
  String get airportName => _airportName ?? '';
  set airportName(String? val) => _airportName = val;
  bool hasAirportName() => _airportName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  bool hasLongitude() => _longitude != null;

  // "airport_timezone" field.
  String? _airportTimezone;
  String get airportTimezone => _airportTimezone ?? '';
  set airportTimezone(String? val) => _airportTimezone = val;
  bool hasAirportTimezone() => _airportTimezone != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;
  bool hasCountryCode() => _countryCode != null;

  // "country_timezone" field.
  String? _countryTimezone;
  String get countryTimezone => _countryTimezone ?? '';
  set countryTimezone(String? val) => _countryTimezone = val;
  bool hasCountryTimezone() => _countryTimezone != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "country_timezone_id" field.
  String? _countryTimezoneId;
  String get countryTimezoneId => _countryTimezoneId ?? '';
  set countryTimezoneId(String? val) => _countryTimezoneId = val;
  bool hasCountryTimezoneId() => _countryTimezoneId != null;

  static AirportDataViewStruct fromMap(Map<String, dynamic> data) =>
      AirportDataViewStruct(
        airportId: data['airport_id'] as String?,
        iataCode: data['iata_code'] as String?,
        icaoCode: data['icao_code'] as String?,
        airportName: data['airport_name'] as String?,
        city: data['city'] as String?,
        country: data['country'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        airportTimezone: data['airport_timezone'] as String?,
        countryCode: data['country_code'] as String?,
        countryTimezone: data['country_timezone'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        countryTimezoneId: data['country_timezone_id'] as String?,
      );

  static AirportDataViewStruct? maybeFromMap(dynamic data) => data is Map
      ? AirportDataViewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'airport_id': _airportId,
        'iata_code': _iataCode,
        'icao_code': _icaoCode,
        'airport_name': _airportName,
        'city': _city,
        'country': _country,
        'latitude': _latitude,
        'longitude': _longitude,
        'airport_timezone': _airportTimezone,
        'country_code': _countryCode,
        'country_timezone': _countryTimezone,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'country_timezone_id': _countryTimezoneId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'airport_id': serializeParam(
          _airportId,
          ParamType.String,
        ),
        'iata_code': serializeParam(
          _iataCode,
          ParamType.String,
        ),
        'icao_code': serializeParam(
          _icaoCode,
          ParamType.String,
        ),
        'airport_name': serializeParam(
          _airportName,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'airport_timezone': serializeParam(
          _airportTimezone,
          ParamType.String,
        ),
        'country_code': serializeParam(
          _countryCode,
          ParamType.String,
        ),
        'country_timezone': serializeParam(
          _countryTimezone,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'country_timezone_id': serializeParam(
          _countryTimezoneId,
          ParamType.String,
        ),
      }.withoutNulls;

  static AirportDataViewStruct fromSerializableMap(Map<String, dynamic> data) =>
      AirportDataViewStruct(
        airportId: deserializeParam(
          data['airport_id'],
          ParamType.String,
          false,
        ),
        iataCode: deserializeParam(
          data['iata_code'],
          ParamType.String,
          false,
        ),
        icaoCode: deserializeParam(
          data['icao_code'],
          ParamType.String,
          false,
        ),
        airportName: deserializeParam(
          data['airport_name'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
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
        airportTimezone: deserializeParam(
          data['airport_timezone'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['country_code'],
          ParamType.String,
          false,
        ),
        countryTimezone: deserializeParam(
          data['country_timezone'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        countryTimezoneId: deserializeParam(
          data['country_timezone_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AirportDataViewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AirportDataViewStruct &&
        airportId == other.airportId &&
        iataCode == other.iataCode &&
        icaoCode == other.icaoCode &&
        airportName == other.airportName &&
        city == other.city &&
        country == other.country &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        airportTimezone == other.airportTimezone &&
        countryCode == other.countryCode &&
        countryTimezone == other.countryTimezone &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        countryTimezoneId == other.countryTimezoneId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        airportId,
        iataCode,
        icaoCode,
        airportName,
        city,
        country,
        latitude,
        longitude,
        airportTimezone,
        countryCode,
        countryTimezone,
        createdAt,
        updatedAt,
        countryTimezoneId,
      ]);
}
