// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripNowStruct extends BaseStruct {
  TripNowStruct({
    String? seat,
    String? airline,
    String? id,
    String? createdAt,
    String? pnrNumber,
    String? updatedAt,
    String? gateNumber,
    String? arrivalTime,
    String? flightClass,
    String? flightNumber,
    String? departureDate,
    String? departureTime,
    String? arrivalAirport,
    String? arrivalTerminal,
    String? arrivalTimezone,
    String? departureAirport,
    String? departureTerminal,
    String? departureTimezone,
    String? araivalDate,
    String? arrivalAirportName,
    String? departureAirportName,
    String? departureAt,
    String? arrivalAt,
    String? belt,
  })  : _seat = seat,
        _airline = airline,
        _id = id,
        _createdAt = createdAt,
        _pnrNumber = pnrNumber,
        _updatedAt = updatedAt,
        _gateNumber = gateNumber,
        _arrivalTime = arrivalTime,
        _flightClass = flightClass,
        _flightNumber = flightNumber,
        _departureDate = departureDate,
        _departureTime = departureTime,
        _arrivalAirport = arrivalAirport,
        _arrivalTerminal = arrivalTerminal,
        _arrivalTimezone = arrivalTimezone,
        _departureAirport = departureAirport,
        _departureTerminal = departureTerminal,
        _departureTimezone = departureTimezone,
        _araivalDate = araivalDate,
        _arrivalAirportName = arrivalAirportName,
        _departureAirportName = departureAirportName,
        _departureAt = departureAt,
        _arrivalAt = arrivalAt,
        _belt = belt;

  // "seat" field.
  String? _seat;
  String get seat => _seat ?? '';
  set seat(String? val) => _seat = val;

  bool hasSeat() => _seat != null;

  // "airline" field.
  String? _airline;
  String get airline => _airline ?? '';
  set airline(String? val) => _airline = val;

  bool hasAirline() => _airline != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "pnr_number" field.
  String? _pnrNumber;
  String get pnrNumber => _pnrNumber ?? '';
  set pnrNumber(String? val) => _pnrNumber = val;

  bool hasPnrNumber() => _pnrNumber != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "gate_number" field.
  String? _gateNumber;
  String get gateNumber => _gateNumber ?? '';
  set gateNumber(String? val) => _gateNumber = val;

  bool hasGateNumber() => _gateNumber != null;

  // "arrival_time" field.
  String? _arrivalTime;
  String get arrivalTime => _arrivalTime ?? '';
  set arrivalTime(String? val) => _arrivalTime = val;

  bool hasArrivalTime() => _arrivalTime != null;

  // "flight_class" field.
  String? _flightClass;
  String get flightClass => _flightClass ?? '';
  set flightClass(String? val) => _flightClass = val;

  bool hasFlightClass() => _flightClass != null;

  // "flight_number" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  set flightNumber(String? val) => _flightNumber = val;

  bool hasFlightNumber() => _flightNumber != null;

  // "departure_date" field.
  String? _departureDate;
  String get departureDate => _departureDate ?? '';
  set departureDate(String? val) => _departureDate = val;

  bool hasDepartureDate() => _departureDate != null;

  // "departure_time" field.
  String? _departureTime;
  String get departureTime => _departureTime ?? '';
  set departureTime(String? val) => _departureTime = val;

  bool hasDepartureTime() => _departureTime != null;

  // "arrival_airport" field.
  String? _arrivalAirport;
  String get arrivalAirport => _arrivalAirport ?? '';
  set arrivalAirport(String? val) => _arrivalAirport = val;

  bool hasArrivalAirport() => _arrivalAirport != null;

  // "arrival_terminal" field.
  String? _arrivalTerminal;
  String get arrivalTerminal => _arrivalTerminal ?? '';
  set arrivalTerminal(String? val) => _arrivalTerminal = val;

  bool hasArrivalTerminal() => _arrivalTerminal != null;

  // "arrival_timezone" field.
  String? _arrivalTimezone;
  String get arrivalTimezone => _arrivalTimezone ?? '';
  set arrivalTimezone(String? val) => _arrivalTimezone = val;

  bool hasArrivalTimezone() => _arrivalTimezone != null;

  // "departure_airport" field.
  String? _departureAirport;
  String get departureAirport => _departureAirport ?? '';
  set departureAirport(String? val) => _departureAirport = val;

  bool hasDepartureAirport() => _departureAirport != null;

  // "departure_terminal" field.
  String? _departureTerminal;
  String get departureTerminal => _departureTerminal ?? '';
  set departureTerminal(String? val) => _departureTerminal = val;

  bool hasDepartureTerminal() => _departureTerminal != null;

  // "departure_timezone" field.
  String? _departureTimezone;
  String get departureTimezone => _departureTimezone ?? '';
  set departureTimezone(String? val) => _departureTimezone = val;

  bool hasDepartureTimezone() => _departureTimezone != null;

  // "araival_date" field.
  String? _araivalDate;
  String get araivalDate => _araivalDate ?? '';
  set araivalDate(String? val) => _araivalDate = val;

  bool hasAraivalDate() => _araivalDate != null;

  // "arrival_airport_name" field.
  String? _arrivalAirportName;
  String get arrivalAirportName => _arrivalAirportName ?? '';
  set arrivalAirportName(String? val) => _arrivalAirportName = val;

  bool hasArrivalAirportName() => _arrivalAirportName != null;

  // "departure_airport_name" field.
  String? _departureAirportName;
  String get departureAirportName => _departureAirportName ?? '';
  set departureAirportName(String? val) => _departureAirportName = val;

  bool hasDepartureAirportName() => _departureAirportName != null;

  // "departure_at" field.
  String? _departureAt;
  String get departureAt => _departureAt ?? '';
  set departureAt(String? val) => _departureAt = val;

  bool hasDepartureAt() => _departureAt != null;

  // "arrival_at" field.
  String? _arrivalAt;
  String get arrivalAt => _arrivalAt ?? '';
  set arrivalAt(String? val) => _arrivalAt = val;

  bool hasArrivalAt() => _arrivalAt != null;

  // "belt" field.
  String? _belt;
  String get belt => _belt ?? '';
  set belt(String? val) => _belt = val;

  bool hasBelt() => _belt != null;

  static TripNowStruct fromMap(Map<String, dynamic> data) => TripNowStruct(
        seat: data['seat'] as String?,
        airline: data['airline'] as String?,
        id: data['id'] as String?,
        createdAt: data['created_at'] as String?,
        pnrNumber: data['pnr_number'] as String?,
        updatedAt: data['updated_at'] as String?,
        gateNumber: data['gate_number'] as String?,
        arrivalTime: data['arrival_time'] as String?,
        flightClass: data['flight_class'] as String?,
        flightNumber: data['flight_number'] as String?,
        departureDate: data['departure_date'] as String?,
        departureTime: data['departure_time'] as String?,
        arrivalAirport: data['arrival_airport'] as String?,
        arrivalTerminal: data['arrival_terminal'] as String?,
        arrivalTimezone: data['arrival_timezone'] as String?,
        departureAirport: data['departure_airport'] as String?,
        departureTerminal: data['departure_terminal'] as String?,
        departureTimezone: data['departure_timezone'] as String?,
        araivalDate: data['araival_date'] as String?,
        arrivalAirportName: data['arrival_airport_name'] as String?,
        departureAirportName: data['departure_airport_name'] as String?,
        departureAt: data['departure_at'] as String?,
        arrivalAt: data['arrival_at'] as String?,
        belt: data['belt'] as String?,
      );

  static TripNowStruct? maybeFromMap(dynamic data) =>
      data is Map ? TripNowStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'seat': _seat,
        'airline': _airline,
        'id': _id,
        'created_at': _createdAt,
        'pnr_number': _pnrNumber,
        'updated_at': _updatedAt,
        'gate_number': _gateNumber,
        'arrival_time': _arrivalTime,
        'flight_class': _flightClass,
        'flight_number': _flightNumber,
        'departure_date': _departureDate,
        'departure_time': _departureTime,
        'arrival_airport': _arrivalAirport,
        'arrival_terminal': _arrivalTerminal,
        'arrival_timezone': _arrivalTimezone,
        'departure_airport': _departureAirport,
        'departure_terminal': _departureTerminal,
        'departure_timezone': _departureTimezone,
        'araival_date': _araivalDate,
        'arrival_airport_name': _arrivalAirportName,
        'departure_airport_name': _departureAirportName,
        'departure_at': _departureAt,
        'arrival_at': _arrivalAt,
        'belt': _belt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'seat': serializeParam(
          _seat,
          ParamType.String,
        ),
        'airline': serializeParam(
          _airline,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'pnr_number': serializeParam(
          _pnrNumber,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'gate_number': serializeParam(
          _gateNumber,
          ParamType.String,
        ),
        'arrival_time': serializeParam(
          _arrivalTime,
          ParamType.String,
        ),
        'flight_class': serializeParam(
          _flightClass,
          ParamType.String,
        ),
        'flight_number': serializeParam(
          _flightNumber,
          ParamType.String,
        ),
        'departure_date': serializeParam(
          _departureDate,
          ParamType.String,
        ),
        'departure_time': serializeParam(
          _departureTime,
          ParamType.String,
        ),
        'arrival_airport': serializeParam(
          _arrivalAirport,
          ParamType.String,
        ),
        'arrival_terminal': serializeParam(
          _arrivalTerminal,
          ParamType.String,
        ),
        'arrival_timezone': serializeParam(
          _arrivalTimezone,
          ParamType.String,
        ),
        'departure_airport': serializeParam(
          _departureAirport,
          ParamType.String,
        ),
        'departure_terminal': serializeParam(
          _departureTerminal,
          ParamType.String,
        ),
        'departure_timezone': serializeParam(
          _departureTimezone,
          ParamType.String,
        ),
        'araival_date': serializeParam(
          _araivalDate,
          ParamType.String,
        ),
        'arrival_airport_name': serializeParam(
          _arrivalAirportName,
          ParamType.String,
        ),
        'departure_airport_name': serializeParam(
          _departureAirportName,
          ParamType.String,
        ),
        'departure_at': serializeParam(
          _departureAt,
          ParamType.String,
        ),
        'arrival_at': serializeParam(
          _arrivalAt,
          ParamType.String,
        ),
        'belt': serializeParam(
          _belt,
          ParamType.String,
        ),
      }.withoutNulls;

  static TripNowStruct fromSerializableMap(Map<String, dynamic> data) =>
      TripNowStruct(
        seat: deserializeParam(
          data['seat'],
          ParamType.String,
          false,
        ),
        airline: deserializeParam(
          data['airline'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        pnrNumber: deserializeParam(
          data['pnr_number'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        gateNumber: deserializeParam(
          data['gate_number'],
          ParamType.String,
          false,
        ),
        arrivalTime: deserializeParam(
          data['arrival_time'],
          ParamType.String,
          false,
        ),
        flightClass: deserializeParam(
          data['flight_class'],
          ParamType.String,
          false,
        ),
        flightNumber: deserializeParam(
          data['flight_number'],
          ParamType.String,
          false,
        ),
        departureDate: deserializeParam(
          data['departure_date'],
          ParamType.String,
          false,
        ),
        departureTime: deserializeParam(
          data['departure_time'],
          ParamType.String,
          false,
        ),
        arrivalAirport: deserializeParam(
          data['arrival_airport'],
          ParamType.String,
          false,
        ),
        arrivalTerminal: deserializeParam(
          data['arrival_terminal'],
          ParamType.String,
          false,
        ),
        arrivalTimezone: deserializeParam(
          data['arrival_timezone'],
          ParamType.String,
          false,
        ),
        departureAirport: deserializeParam(
          data['departure_airport'],
          ParamType.String,
          false,
        ),
        departureTerminal: deserializeParam(
          data['departure_terminal'],
          ParamType.String,
          false,
        ),
        departureTimezone: deserializeParam(
          data['departure_timezone'],
          ParamType.String,
          false,
        ),
        araivalDate: deserializeParam(
          data['araival_date'],
          ParamType.String,
          false,
        ),
        arrivalAirportName: deserializeParam(
          data['arrival_airport_name'],
          ParamType.String,
          false,
        ),
        departureAirportName: deserializeParam(
          data['departure_airport_name'],
          ParamType.String,
          false,
        ),
        departureAt: deserializeParam(
          data['departure_at'],
          ParamType.String,
          false,
        ),
        arrivalAt: deserializeParam(
          data['arrival_at'],
          ParamType.String,
          false,
        ),
        belt: deserializeParam(
          data['belt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TripNowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TripNowStruct &&
        seat == other.seat &&
        airline == other.airline &&
        id == other.id &&
        createdAt == other.createdAt &&
        pnrNumber == other.pnrNumber &&
        updatedAt == other.updatedAt &&
        gateNumber == other.gateNumber &&
        arrivalTime == other.arrivalTime &&
        flightClass == other.flightClass &&
        flightNumber == other.flightNumber &&
        departureDate == other.departureDate &&
        departureTime == other.departureTime &&
        arrivalAirport == other.arrivalAirport &&
        arrivalTerminal == other.arrivalTerminal &&
        arrivalTimezone == other.arrivalTimezone &&
        departureAirport == other.departureAirport &&
        departureTerminal == other.departureTerminal &&
        departureTimezone == other.departureTimezone &&
        araivalDate == other.araivalDate &&
        arrivalAirportName == other.arrivalAirportName &&
        departureAirportName == other.departureAirportName &&
        departureAt == other.departureAt &&
        arrivalAt == other.arrivalAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        seat,
        airline,
        id,
        createdAt,
        pnrNumber,
        updatedAt,
        gateNumber,
        arrivalTime,
        flightClass,
        flightNumber,
        departureDate,
        departureTime,
        arrivalAirport,
        arrivalTerminal,
        arrivalTimezone,
        departureAirport,
        departureTerminal,
        departureTimezone,
        araivalDate,
        arrivalAirportName,
        departureAirportName,
        departureAt,
        arrivalAt
      ]);
}

TripNowStruct createTripNowStruct({
  String? seat,
  String? airline,
  String? id,
  String? createdAt,
  String? pnrNumber,
  String? updatedAt,
  String? gateNumber,
  String? arrivalTime,
  String? flightClass,
  String? flightNumber,
  String? departureDate,
  String? departureTime,
  String? arrivalAirport,
  String? arrivalTerminal,
  String? arrivalTimezone,
  String? departureAirport,
  String? departureTerminal,
  String? departureTimezone,
  String? araivalDate,
  String? arrivalAirportName,
  String? departureAirportName,
  String? departureAt,
  String? arrivalAt,
}) =>
    TripNowStruct(
      seat: seat,
      airline: airline,
      id: id,
      createdAt: createdAt,
      pnrNumber: pnrNumber,
      updatedAt: updatedAt,
      gateNumber: gateNumber,
      arrivalTime: arrivalTime,
      flightClass: flightClass,
      flightNumber: flightNumber,
      departureDate: departureDate,
      departureTime: departureTime,
      arrivalAirport: arrivalAirport,
      arrivalTerminal: arrivalTerminal,
      arrivalTimezone: arrivalTimezone,
      departureAirport: departureAirport,
      departureTerminal: departureTerminal,
      departureTimezone: departureTimezone,
      araivalDate: araivalDate,
      arrivalAirportName: arrivalAirportName,
      departureAirportName: departureAirportName,
      departureAt: departureAt,
      arrivalAt: arrivalAt,
    );
