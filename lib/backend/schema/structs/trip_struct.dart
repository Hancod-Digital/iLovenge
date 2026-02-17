// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripStruct extends BaseStruct {
  TripStruct({
    String? pnrNumber,
    DateTime? departureDate,
    String? airline,
    String? flightNumber,
    String? flightClass,
    String? departureAirport,
    String? departureTimezone,
    String? departureTerminal,
    String? seat,
    String? gateNumber,
    String? belt,
    String? arrivalAirport,
    DateTime? arrivalTime,
    String? arrivalTimezone,
    String? arrivalTerminal,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    DateTime? departureTime,
    DateTime? araivalDate,
    String? status,
    String? arrivalAirportName,
    String? departureAirportName,
    DateTime? arrivalAt,
    DateTime? departureAt,
  })  : _pnrNumber = pnrNumber,
        _departureDate = departureDate,
        _airline = airline,
        _flightNumber = flightNumber,
        _flightClass = flightClass,
        _departureAirport = departureAirport,
        _departureTimezone = departureTimezone,
        _departureTerminal = departureTerminal,
        _seat = seat,
        _gateNumber = gateNumber,
        _belt = belt,
        _arrivalAirport = arrivalAirport,
        _arrivalTime = arrivalTime,
        _arrivalTimezone = arrivalTimezone,
        _arrivalTerminal = arrivalTerminal,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _id = id,
        _departureTime = departureTime,
        _araivalDate = araivalDate,
        _status = status,
        _arrivalAirportName = arrivalAirportName,
        _departureAirportName = departureAirportName,
        _arrivalAt = arrivalAt,
        _departureAt = departureAt;

  // "pnr_number" field.
  String? _pnrNumber;
  String get pnrNumber => _pnrNumber ?? '';
  set pnrNumber(String? val) => _pnrNumber = val;

  bool hasPnrNumber() => _pnrNumber != null;

  // "departure_date" field.
  DateTime? _departureDate;
  DateTime? get departureDate => _departureDate;
  set departureDate(DateTime? val) => _departureDate = val;

  bool hasDepartureDate() => _departureDate != null;

  // "airline" field.
  String? _airline;
  String get airline => _airline ?? '';
  set airline(String? val) => _airline = val;

  bool hasAirline() => _airline != null;

  // "flight_number" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  set flightNumber(String? val) => _flightNumber = val;

  bool hasFlightNumber() => _flightNumber != null;

  // "flight_class" field.
  String? _flightClass;
  String get flightClass => _flightClass ?? '';
  set flightClass(String? val) => _flightClass = val;

  bool hasFlightClass() => _flightClass != null;

  // "departure_airport" field.
  String? _departureAirport;
  String get departureAirport => _departureAirport ?? '';
  set departureAirport(String? val) => _departureAirport = val;

  bool hasDepartureAirport() => _departureAirport != null;

  // "departure_timezone" field.
  String? _departureTimezone;
  String get departureTimezone => _departureTimezone ?? '';
  set departureTimezone(String? val) => _departureTimezone = val;

  bool hasDepartureTimezone() => _departureTimezone != null;

  // "departure_terminal" field.
  String? _departureTerminal;
  String get departureTerminal => _departureTerminal ?? '';
  set departureTerminal(String? val) => _departureTerminal = val;

  bool hasDepartureTerminal() => _departureTerminal != null;

  // "seat" field.
  String? _seat;
  String get seat => _seat ?? '';
  set seat(String? val) => _seat = val;

  bool hasSeat() => _seat != null;

  // "gate_number" field.
  String? _gateNumber;
  String get gateNumber => _gateNumber ?? '';
  set gateNumber(String? val) => _gateNumber = val;

  bool hasGateNumber() => _gateNumber != null;

  // "belt" field.
  String? _belt;
  String get belt => _belt ?? '';
  set belt(String? val) => _belt = val;

  bool hasBelt() => _belt != null;

  // "arrival_airport" field.
  String? _arrivalAirport;
  String get arrivalAirport => _arrivalAirport ?? '';
  set arrivalAirport(String? val) => _arrivalAirport = val;

  bool hasArrivalAirport() => _arrivalAirport != null;

  // "arrival_time" field.
  DateTime? _arrivalTime;
  DateTime? get arrivalTime => _arrivalTime;
  set arrivalTime(DateTime? val) => _arrivalTime = val;

  bool hasArrivalTime() => _arrivalTime != null;

  // "arrival_timezone" field.
  String? _arrivalTimezone;
  String get arrivalTimezone => _arrivalTimezone ?? '';
  set arrivalTimezone(String? val) => _arrivalTimezone = val;

  bool hasArrivalTimezone() => _arrivalTimezone != null;

  // "arrival_terminal" field.
  String? _arrivalTerminal;
  String get arrivalTerminal => _arrivalTerminal ?? '';
  set arrivalTerminal(String? val) => _arrivalTerminal = val;

  bool hasArrivalTerminal() => _arrivalTerminal != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "departure_time" field.
  DateTime? _departureTime;
  DateTime? get departureTime => _departureTime;
  set departureTime(DateTime? val) => _departureTime = val;

  bool hasDepartureTime() => _departureTime != null;

  // "araival_date" field.
  DateTime? _araivalDate;
  DateTime? get araivalDate => _araivalDate;
  set araivalDate(DateTime? val) => _araivalDate = val;

  bool hasAraivalDate() => _araivalDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

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

  // "arrival_at" field.
  DateTime? _arrivalAt;
  DateTime? get arrivalAt => _arrivalAt;
  set arrivalAt(DateTime? val) => _arrivalAt = val;

  bool hasArrivalAt() => _arrivalAt != null;

  // "departure_at" field.
  DateTime? _departureAt;
  DateTime? get departureAt => _departureAt;
  set departureAt(DateTime? val) => _departureAt = val;

  bool hasDepartureAt() => _departureAt != null;

  static TripStruct fromMap(Map<String, dynamic> data) => TripStruct(
        pnrNumber: data['pnr_number'] as String?,
        departureDate: data['departure_date'] as DateTime?,
        airline: data['airline'] as String?,
        flightNumber: data['flight_number'] as String?,
        flightClass: data['flight_class'] as String?,
        departureAirport: data['departure_airport'] as String?,
        departureTimezone: data['departure_timezone'] as String?,
        departureTerminal: data['departure_terminal'] as String?,
        seat: data['seat'] as String?,
        gateNumber: data['gate_number'] as String?,
        belt: data['belt'] as String?,
        arrivalAirport: data['arrival_airport'] as String?,
        arrivalTime: data['arrival_time'] as DateTime?,
        arrivalTimezone: data['arrival_timezone'] as String?,
        arrivalTerminal: data['arrival_terminal'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        id: data['id'] as String?,
        departureTime: data['departure_time'] as DateTime?,
        araivalDate: data['araival_date'] as DateTime?,
        status: data['status'] as String?,
        arrivalAirportName: data['arrival_airport_name'] as String?,
        departureAirportName: data['departure_airport_name'] as String?,
        arrivalAt: data['arrival_at'] as DateTime?,
        departureAt: data['departure_at'] as DateTime?,
      );

  static TripStruct? maybeFromMap(dynamic data) =>
      data is Map ? TripStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pnr_number': _pnrNumber,
        'departure_date': _departureDate,
        'airline': _airline,
        'flight_number': _flightNumber,
        'flight_class': _flightClass,
        'departure_airport': _departureAirport,
        'departure_timezone': _departureTimezone,
        'departure_terminal': _departureTerminal,
        'seat': _seat,
        'gate_number': _gateNumber,
        'belt': _belt,
        'arrival_airport': _arrivalAirport,
        'arrival_time': _arrivalTime,
        'arrival_timezone': _arrivalTimezone,
        'arrival_terminal': _arrivalTerminal,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'id': _id,
        'departure_time': _departureTime,
        'araival_date': _araivalDate,
        'status': _status,
        'arrival_airport_name': _arrivalAirportName,
        'departure_airport_name': _departureAirportName,
        'arrival_at': _arrivalAt,
        'departure_at': _departureAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pnr_number': serializeParam(
          _pnrNumber,
          ParamType.String,
        ),
        'departure_date': serializeParam(
          _departureDate,
          ParamType.DateTime,
        ),
        'airline': serializeParam(
          _airline,
          ParamType.String,
        ),
        'flight_number': serializeParam(
          _flightNumber,
          ParamType.String,
        ),
        'flight_class': serializeParam(
          _flightClass,
          ParamType.String,
        ),
        'departure_airport': serializeParam(
          _departureAirport,
          ParamType.String,
        ),
        'departure_timezone': serializeParam(
          _departureTimezone,
          ParamType.String,
        ),
        'departure_terminal': serializeParam(
          _departureTerminal,
          ParamType.String,
        ),
        'seat': serializeParam(
          _seat,
          ParamType.String,
        ),
        'gate_number': serializeParam(
          _gateNumber,
          ParamType.String,
        ),
        'belt': serializeParam(
          _belt,
          ParamType.String,
        ),
        'arrival_airport': serializeParam(
          _arrivalAirport,
          ParamType.String,
        ),
        'arrival_time': serializeParam(
          _arrivalTime,
          ParamType.DateTime,
        ),
        'arrival_timezone': serializeParam(
          _arrivalTimezone,
          ParamType.String,
        ),
        'arrival_terminal': serializeParam(
          _arrivalTerminal,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'departure_time': serializeParam(
          _departureTime,
          ParamType.DateTime,
        ),
        'araival_date': serializeParam(
          _araivalDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
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
        'arrival_at': serializeParam(
          _arrivalAt,
          ParamType.DateTime,
        ),
        'departure_at': serializeParam(
          _departureAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TripStruct fromSerializableMap(Map<String, dynamic> data) =>
      TripStruct(
        pnrNumber: deserializeParam(
          data['pnr_number'],
          ParamType.String,
          false,
        ),
        departureDate: deserializeParam(
          data['departure_date'],
          ParamType.DateTime,
          false,
        ),
        airline: deserializeParam(
          data['airline'],
          ParamType.String,
          false,
        ),
        flightNumber: deserializeParam(
          data['flight_number'],
          ParamType.String,
          false,
        ),
        flightClass: deserializeParam(
          data['flight_class'],
          ParamType.String,
          false,
        ),
        departureAirport: deserializeParam(
          data['departure_airport'],
          ParamType.String,
          false,
        ),
        departureTimezone: deserializeParam(
          data['departure_timezone'],
          ParamType.String,
          false,
        ),
        departureTerminal: deserializeParam(
          data['departure_terminal'],
          ParamType.String,
          false,
        ),
        seat: deserializeParam(
          data['seat'],
          ParamType.String,
          false,
        ),
        gateNumber: deserializeParam(
          data['gate_number'],
          ParamType.String,
          false,
        ),
        belt: deserializeParam(
          data['belt'],
          ParamType.String,
          false,
        ),
        arrivalAirport: deserializeParam(
          data['arrival_airport'],
          ParamType.String,
          false,
        ),
        arrivalTime: deserializeParam(
          data['arrival_time'],
          ParamType.DateTime,
          false,
        ),
        arrivalTimezone: deserializeParam(
          data['arrival_timezone'],
          ParamType.String,
          false,
        ),
        arrivalTerminal: deserializeParam(
          data['arrival_terminal'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        departureTime: deserializeParam(
          data['departure_time'],
          ParamType.DateTime,
          false,
        ),
        araivalDate: deserializeParam(
          data['araival_date'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
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
        arrivalAt: deserializeParam(
          data['arrival_at'],
          ParamType.DateTime,
          false,
        ),
        departureAt: deserializeParam(
          data['departure_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TripStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TripStruct &&
        pnrNumber == other.pnrNumber &&
        departureDate == other.departureDate &&
        airline == other.airline &&
        flightNumber == other.flightNumber &&
        flightClass == other.flightClass &&
        departureAirport == other.departureAirport &&
        departureTimezone == other.departureTimezone &&
        departureTerminal == other.departureTerminal &&
        seat == other.seat &&
        gateNumber == other.gateNumber &&
        arrivalAirport == other.arrivalAirport &&
        arrivalTime == other.arrivalTime &&
        arrivalTimezone == other.arrivalTimezone &&
        arrivalTerminal == other.arrivalTerminal &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        id == other.id &&
        departureTime == other.departureTime &&
        araivalDate == other.araivalDate &&
        status == other.status &&
        arrivalAirportName == other.arrivalAirportName &&
        departureAirportName == other.departureAirportName &&
        arrivalAt == other.arrivalAt &&
        departureAt == other.departureAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pnrNumber,
        departureDate,
        airline,
        flightNumber,
        flightClass,
        departureAirport,
        departureTimezone,
        departureTerminal,
        seat,
        gateNumber,
        arrivalAirport,
        arrivalTime,
        arrivalTimezone,
        arrivalTerminal,
        createdAt,
        updatedAt,
        id,
        departureTime,
        araivalDate,
        status,
        arrivalAirportName,
        departureAirportName,
        arrivalAt,
        departureAt
      ]);
}

TripStruct createTripStruct({
  String? pnrNumber,
  DateTime? departureDate,
  String? airline,
  String? flightNumber,
  String? flightClass,
  String? departureAirport,
  String? departureTimezone,
  String? departureTerminal,
  String? seat,
  String? gateNumber,
  String? arrivalAirport,
  DateTime? arrivalTime,
  String? arrivalTimezone,
  String? arrivalTerminal,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? id,
  DateTime? departureTime,
  DateTime? araivalDate,
  String? status,
  String? arrivalAirportName,
  String? departureAirportName,
  DateTime? arrivalAt,
  DateTime? departureAt,
}) =>
    TripStruct(
      pnrNumber: pnrNumber,
      departureDate: departureDate,
      airline: airline,
      flightNumber: flightNumber,
      flightClass: flightClass,
      departureAirport: departureAirport,
      departureTimezone: departureTimezone,
      departureTerminal: departureTerminal,
      seat: seat,
      gateNumber: gateNumber,
      arrivalAirport: arrivalAirport,
      arrivalTime: arrivalTime,
      arrivalTimezone: arrivalTimezone,
      arrivalTerminal: arrivalTerminal,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      departureTime: departureTime,
      araivalDate: araivalDate,
      status: status,
      arrivalAirportName: arrivalAirportName,
      departureAirportName: departureAirportName,
      arrivalAt: arrivalAt,
      departureAt: departureAt,
    );
