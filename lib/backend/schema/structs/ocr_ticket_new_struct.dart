// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OcrTicketNewStruct extends BaseStruct {
  OcrTicketNewStruct({
    String? pnr,
    String? tripType,
    List<TripDetailsStruct>? tripDetails,
    String? flightType,
  })  : _pnr = pnr,
        _tripType = tripType,
        _tripDetails = tripDetails,
        _flightType = flightType;

  // "PNR" field.
  String? _pnr;
  String get pnr => _pnr ?? '';
  set pnr(String? val) => _pnr = val;

  bool hasPnr() => _pnr != null;

  // "tripType" field.
  String? _tripType;
  String get tripType => _tripType ?? '';
  set tripType(String? val) => _tripType = val;

  bool hasTripType() => _tripType != null;

  // "tripDetails" field.
  List<TripDetailsStruct>? _tripDetails;
  List<TripDetailsStruct> get tripDetails => _tripDetails ?? const [];
  set tripDetails(List<TripDetailsStruct>? val) => _tripDetails = val;

  void updateTripDetails(Function(List<TripDetailsStruct>) updateFn) {
    updateFn(_tripDetails ??= []);
  }

  bool hasTripDetails() => _tripDetails != null;

  // "flightType" field.
  String? _flightType;
  String get flightType => _flightType ?? '';
  set flightType(String? val) => _flightType = val;

  bool hasFlightType() => _flightType != null;

  static OcrTicketNewStruct fromMap(Map<String, dynamic> data) =>
      OcrTicketNewStruct(
        pnr: data['PNR'] as String?,
        tripType: data['tripType'] as String?,
        tripDetails: getStructList(
          data['tripDetails'],
          TripDetailsStruct.fromMap,
        ),
        flightType: data['flightType'] as String?,
      );

  static OcrTicketNewStruct? maybeFromMap(dynamic data) => data is Map
      ? OcrTicketNewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'PNR': _pnr,
        'tripType': _tripType,
        'tripDetails': _tripDetails?.map((e) => e.toMap()).toList(),
        'flightType': _flightType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PNR': serializeParam(
          _pnr,
          ParamType.String,
        ),
        'tripType': serializeParam(
          _tripType,
          ParamType.String,
        ),
        'tripDetails': serializeParam(
          _tripDetails,
          ParamType.DataStruct,
          isList: true,
        ),
        'flightType': serializeParam(
          _flightType,
          ParamType.String,
        ),
      }.withoutNulls;

  static OcrTicketNewStruct fromSerializableMap(Map<String, dynamic> data) =>
      OcrTicketNewStruct(
        pnr: deserializeParam(
          data['PNR'],
          ParamType.String,
          false,
        ),
        tripType: deserializeParam(
          data['tripType'],
          ParamType.String,
          false,
        ),
        tripDetails: deserializeStructParam<TripDetailsStruct>(
          data['tripDetails'],
          ParamType.DataStruct,
          true,
          structBuilder: TripDetailsStruct.fromSerializableMap,
        ),
        flightType: deserializeParam(
          data['flightType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OcrTicketNewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OcrTicketNewStruct &&
        pnr == other.pnr &&
        tripType == other.tripType &&
        listEquality.equals(tripDetails, other.tripDetails) &&
        flightType == other.flightType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([pnr, tripType, tripDetails, flightType]);
}

OcrTicketNewStruct createOcrTicketNewStruct({
  String? pnr,
  String? tripType,
  String? flightType,
}) =>
    OcrTicketNewStruct(
      pnr: pnr,
      tripType: tripType,
      flightType: flightType,
    );
