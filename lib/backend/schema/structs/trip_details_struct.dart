// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripDetailsStruct extends BaseStruct {
  TripDetailsStruct({
    String? pnr,
    String? departureDateTime,
    String? airline,
    String? flightNumber,
    String? cabinClass,
    String? departureAirport,
    String? departureTerminal,
    String? seat,
    String? gate,
    String? arrivalAirport,
    String? arrivalTerminal,
    String? arrivalDateTime,
    String? arrivalAirportTimezone,
    String? departureAirportTimezone,
    String? departureAirportName,
    String? arrivalAirportName,
  })  : _pnr = pnr,
        _departureDateTime = departureDateTime,
        _airline = airline,
        _flightNumber = flightNumber,
        _cabinClass = cabinClass,
        _departureAirport = departureAirport,
        _departureTerminal = departureTerminal,
        _seat = seat,
        _gate = gate,
        _arrivalAirport = arrivalAirport,
        _arrivalTerminal = arrivalTerminal,
        _arrivalDateTime = arrivalDateTime,
        _arrivalAirportTimezone = arrivalAirportTimezone,
        _departureAirportTimezone = departureAirportTimezone,
        _departureAirportName = departureAirportName,
        _arrivalAirportName = arrivalAirportName;

  // "PNR" field.
  String? _pnr;
  String get pnr => _pnr ?? '';
  set pnr(String? val) => _pnr = val;

  bool hasPnr() => _pnr != null;

  // "DepartureDateTime" field.
  String? _departureDateTime;
  String get departureDateTime => _departureDateTime ?? '';
  set departureDateTime(String? val) => _departureDateTime = val;

  bool hasDepartureDateTime() => _departureDateTime != null;

  // "Airline" field.
  String? _airline;
  String get airline => _airline ?? '';
  set airline(String? val) => _airline = val;

  bool hasAirline() => _airline != null;

  // "FlightNumber" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  set flightNumber(String? val) => _flightNumber = val;

  bool hasFlightNumber() => _flightNumber != null;

  // "CabinClass" field.
  String? _cabinClass;
  String get cabinClass => _cabinClass ?? '';
  set cabinClass(String? val) => _cabinClass = val;

  bool hasCabinClass() => _cabinClass != null;

  // "DepartureAirport" field.
  String? _departureAirport;
  String get departureAirport => _departureAirport ?? '';
  set departureAirport(String? val) => _departureAirport = val;

  bool hasDepartureAirport() => _departureAirport != null;

  // "DepartureTerminal" field.
  String? _departureTerminal;
  String get departureTerminal => _departureTerminal ?? '';
  set departureTerminal(String? val) => _departureTerminal = val;

  bool hasDepartureTerminal() => _departureTerminal != null;

  // "Seat" field.
  String? _seat;
  String get seat => _seat ?? '';
  set seat(String? val) => _seat = val;

  bool hasSeat() => _seat != null;

  // "Gate" field.
  String? _gate;
  String get gate => _gate ?? '';
  set gate(String? val) => _gate = val;

  bool hasGate() => _gate != null;

  // "ArrivalAirport" field.
  String? _arrivalAirport;
  String get arrivalAirport => _arrivalAirport ?? '';
  set arrivalAirport(String? val) => _arrivalAirport = val;

  bool hasArrivalAirport() => _arrivalAirport != null;

  // "ArrivalTerminal" field.
  String? _arrivalTerminal;
  String get arrivalTerminal => _arrivalTerminal ?? '';
  set arrivalTerminal(String? val) => _arrivalTerminal = val;

  bool hasArrivalTerminal() => _arrivalTerminal != null;

  // "ArrivalDateTime" field.
  String? _arrivalDateTime;
  String get arrivalDateTime => _arrivalDateTime ?? '';
  set arrivalDateTime(String? val) => _arrivalDateTime = val;

  bool hasArrivalDateTime() => _arrivalDateTime != null;

  // "ArrivalAirportTimezone" field.
  String? _arrivalAirportTimezone;
  String get arrivalAirportTimezone => _arrivalAirportTimezone ?? '';
  set arrivalAirportTimezone(String? val) => _arrivalAirportTimezone = val;

  bool hasArrivalAirportTimezone() => _arrivalAirportTimezone != null;

  // "DepartureAirportTimezone" field.
  String? _departureAirportTimezone;
  String get departureAirportTimezone => _departureAirportTimezone ?? '';
  set departureAirportTimezone(String? val) => _departureAirportTimezone = val;

  bool hasDepartureAirportTimezone() => _departureAirportTimezone != null;

  // "DepartureAirportName" field.
  String? _departureAirportName;
  String get departureAirportName => _departureAirportName ?? '';
  set departureAirportName(String? val) => _departureAirportName = val;

  bool hasDepartureAirportName() => _departureAirportName != null;

  // "ArrivalAirportName" field.
  String? _arrivalAirportName;
  String get arrivalAirportName => _arrivalAirportName ?? '';
  set arrivalAirportName(String? val) => _arrivalAirportName = val;

  bool hasArrivalAirportName() => _arrivalAirportName != null;

  static TripDetailsStruct fromMap(Map<String, dynamic> data) =>
      TripDetailsStruct(
        pnr: data['PNR'] as String?,
        departureDateTime: data['DepartureDateTime'] as String?,
        airline: data['Airline'] as String?,
        flightNumber: data['FlightNumber'] as String?,
        cabinClass: data['CabinClass'] as String?,
        departureAirport: data['DepartureAirport'] as String?,
        departureTerminal: data['DepartureTerminal'] as String?,
        seat: data['Seat'] as String?,
        gate: data['Gate'] as String?,
        arrivalAirport: data['ArrivalAirport'] as String?,
        arrivalTerminal: data['ArrivalTerminal'] as String?,
        arrivalDateTime: data['ArrivalDateTime'] as String?,
        arrivalAirportTimezone: data['ArrivalAirportTimezone'] as String?,
        departureAirportTimezone: data['DepartureAirportTimezone'] as String?,
        departureAirportName: data['DepartureAirportName'] as String?,
        arrivalAirportName: data['ArrivalAirportName'] as String?,
      );

  static TripDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? TripDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'PNR': _pnr,
        'DepartureDateTime': _departureDateTime,
        'Airline': _airline,
        'FlightNumber': _flightNumber,
        'CabinClass': _cabinClass,
        'DepartureAirport': _departureAirport,
        'DepartureTerminal': _departureTerminal,
        'Seat': _seat,
        'Gate': _gate,
        'ArrivalAirport': _arrivalAirport,
        'ArrivalTerminal': _arrivalTerminal,
        'ArrivalDateTime': _arrivalDateTime,
        'ArrivalAirportTimezone': _arrivalAirportTimezone,
        'DepartureAirportTimezone': _departureAirportTimezone,
        'DepartureAirportName': _departureAirportName,
        'ArrivalAirportName': _arrivalAirportName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'PNR': serializeParam(
          _pnr,
          ParamType.String,
        ),
        'DepartureDateTime': serializeParam(
          _departureDateTime,
          ParamType.String,
        ),
        'Airline': serializeParam(
          _airline,
          ParamType.String,
        ),
        'FlightNumber': serializeParam(
          _flightNumber,
          ParamType.String,
        ),
        'CabinClass': serializeParam(
          _cabinClass,
          ParamType.String,
        ),
        'DepartureAirport': serializeParam(
          _departureAirport,
          ParamType.String,
        ),
        'DepartureTerminal': serializeParam(
          _departureTerminal,
          ParamType.String,
        ),
        'Seat': serializeParam(
          _seat,
          ParamType.String,
        ),
        'Gate': serializeParam(
          _gate,
          ParamType.String,
        ),
        'ArrivalAirport': serializeParam(
          _arrivalAirport,
          ParamType.String,
        ),
        'ArrivalTerminal': serializeParam(
          _arrivalTerminal,
          ParamType.String,
        ),
        'ArrivalDateTime': serializeParam(
          _arrivalDateTime,
          ParamType.String,
        ),
        'ArrivalAirportTimezone': serializeParam(
          _arrivalAirportTimezone,
          ParamType.String,
        ),
        'DepartureAirportTimezone': serializeParam(
          _departureAirportTimezone,
          ParamType.String,
        ),
        'DepartureAirportName': serializeParam(
          _departureAirportName,
          ParamType.String,
        ),
        'ArrivalAirportName': serializeParam(
          _arrivalAirportName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TripDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TripDetailsStruct(
        pnr: deserializeParam(
          data['PNR'],
          ParamType.String,
          false,
        ),
        departureDateTime: deserializeParam(
          data['DepartureDateTime'],
          ParamType.String,
          false,
        ),
        airline: deserializeParam(
          data['Airline'],
          ParamType.String,
          false,
        ),
        flightNumber: deserializeParam(
          data['FlightNumber'],
          ParamType.String,
          false,
        ),
        cabinClass: deserializeParam(
          data['CabinClass'],
          ParamType.String,
          false,
        ),
        departureAirport: deserializeParam(
          data['DepartureAirport'],
          ParamType.String,
          false,
        ),
        departureTerminal: deserializeParam(
          data['DepartureTerminal'],
          ParamType.String,
          false,
        ),
        seat: deserializeParam(
          data['Seat'],
          ParamType.String,
          false,
        ),
        gate: deserializeParam(
          data['Gate'],
          ParamType.String,
          false,
        ),
        arrivalAirport: deserializeParam(
          data['ArrivalAirport'],
          ParamType.String,
          false,
        ),
        arrivalTerminal: deserializeParam(
          data['ArrivalTerminal'],
          ParamType.String,
          false,
        ),
        arrivalDateTime: deserializeParam(
          data['ArrivalDateTime'],
          ParamType.String,
          false,
        ),
        arrivalAirportTimezone: deserializeParam(
          data['ArrivalAirportTimezone'],
          ParamType.String,
          false,
        ),
        departureAirportTimezone: deserializeParam(
          data['DepartureAirportTimezone'],
          ParamType.String,
          false,
        ),
        departureAirportName: deserializeParam(
          data['DepartureAirportName'],
          ParamType.String,
          false,
        ),
        arrivalAirportName: deserializeParam(
          data['ArrivalAirportName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TripDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TripDetailsStruct &&
        pnr == other.pnr &&
        departureDateTime == other.departureDateTime &&
        airline == other.airline &&
        flightNumber == other.flightNumber &&
        cabinClass == other.cabinClass &&
        departureAirport == other.departureAirport &&
        departureTerminal == other.departureTerminal &&
        seat == other.seat &&
        gate == other.gate &&
        arrivalAirport == other.arrivalAirport &&
        arrivalTerminal == other.arrivalTerminal &&
        arrivalDateTime == other.arrivalDateTime &&
        arrivalAirportTimezone == other.arrivalAirportTimezone &&
        departureAirportTimezone == other.departureAirportTimezone &&
        departureAirportName == other.departureAirportName &&
        arrivalAirportName == other.arrivalAirportName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pnr,
        departureDateTime,
        airline,
        flightNumber,
        cabinClass,
        departureAirport,
        departureTerminal,
        seat,
        gate,
        arrivalAirport,
        arrivalTerminal,
        arrivalDateTime,
        arrivalAirportTimezone,
        departureAirportTimezone,
        departureAirportName,
        arrivalAirportName
      ]);
}

TripDetailsStruct createTripDetailsStruct({
  String? pnr,
  String? departureDateTime,
  String? airline,
  String? flightNumber,
  String? cabinClass,
  String? departureAirport,
  String? departureTerminal,
  String? seat,
  String? gate,
  String? arrivalAirport,
  String? arrivalTerminal,
  String? arrivalDateTime,
  String? arrivalAirportTimezone,
  String? departureAirportTimezone,
  String? departureAirportName,
  String? arrivalAirportName,
}) =>
    TripDetailsStruct(
      pnr: pnr,
      departureDateTime: departureDateTime,
      airline: airline,
      flightNumber: flightNumber,
      cabinClass: cabinClass,
      departureAirport: departureAirport,
      departureTerminal: departureTerminal,
      seat: seat,
      gate: gate,
      arrivalAirport: arrivalAirport,
      arrivalTerminal: arrivalTerminal,
      arrivalDateTime: arrivalDateTime,
      arrivalAirportTimezone: arrivalAirportTimezone,
      departureAirportTimezone: departureAirportTimezone,
      departureAirportName: departureAirportName,
      arrivalAirportName: arrivalAirportName,
    );
