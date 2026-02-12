// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripViewStruct extends BaseStruct {
  TripViewStruct({
    String? userId,
    DateTime? departureDate,
    TripStruct? tripsList,
    DateTime? departureTime,
    DateTime? arrivalTime,
    DateTime? araivalDate,
    DateTime? createdAt,
  })  : _userId = userId,
        _departureDate = departureDate,
        _tripsList = tripsList,
        _departureTime = departureTime,
        _arrivalTime = arrivalTime,
        _araivalDate = araivalDate,
        _createdAt = createdAt;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "departure_date" field.
  DateTime? _departureDate;
  DateTime? get departureDate => _departureDate;
  set departureDate(DateTime? val) => _departureDate = val;

  bool hasDepartureDate() => _departureDate != null;

  // "trips_list" field.
  TripStruct? _tripsList;
  TripStruct get tripsList => _tripsList ?? TripStruct();
  set tripsList(TripStruct? val) => _tripsList = val;

  void updateTripsList(Function(TripStruct) updateFn) {
    updateFn(_tripsList ??= TripStruct());
  }

  bool hasTripsList() => _tripsList != null;

  // "departure_time" field.
  DateTime? _departureTime;
  DateTime? get departureTime => _departureTime;
  set departureTime(DateTime? val) => _departureTime = val;

  bool hasDepartureTime() => _departureTime != null;

  // "arrival_time" field.
  DateTime? _arrivalTime;
  DateTime? get arrivalTime => _arrivalTime;
  set arrivalTime(DateTime? val) => _arrivalTime = val;

  bool hasArrivalTime() => _arrivalTime != null;

  // "araival_date" field.
  DateTime? _araivalDate;
  DateTime? get araivalDate => _araivalDate;
  set araivalDate(DateTime? val) => _araivalDate = val;

  bool hasAraivalDate() => _araivalDate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static TripViewStruct fromMap(Map<String, dynamic> data) => TripViewStruct(
        userId: data['user_id'] as String?,
        departureDate: data['departure_date'] as DateTime?,
        tripsList: data['trips_list'] is TripStruct
            ? data['trips_list']
            : TripStruct.maybeFromMap(data['trips_list']),
        departureTime: data['departure_time'] as DateTime?,
        arrivalTime: data['arrival_time'] as DateTime?,
        araivalDate: data['araival_date'] as DateTime?,
        createdAt: data['created_at'] as DateTime?,
      );

  static TripViewStruct? maybeFromMap(dynamic data) =>
      data is Map ? TripViewStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'departure_date': _departureDate,
        'trips_list': _tripsList?.toMap(),
        'departure_time': _departureTime,
        'arrival_time': _arrivalTime,
        'araival_date': _araivalDate,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'departure_date': serializeParam(
          _departureDate,
          ParamType.DateTime,
        ),
        'trips_list': serializeParam(
          _tripsList,
          ParamType.DataStruct,
        ),
        'departure_time': serializeParam(
          _departureTime,
          ParamType.DateTime,
        ),
        'arrival_time': serializeParam(
          _arrivalTime,
          ParamType.DateTime,
        ),
        'araival_date': serializeParam(
          _araivalDate,
          ParamType.DateTime,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TripViewStruct fromSerializableMap(Map<String, dynamic> data) =>
      TripViewStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        departureDate: deserializeParam(
          data['departure_date'],
          ParamType.DateTime,
          false,
        ),
        tripsList: deserializeStructParam(
          data['trips_list'],
          ParamType.DataStruct,
          false,
          structBuilder: TripStruct.fromSerializableMap,
        ),
        departureTime: deserializeParam(
          data['departure_time'],
          ParamType.DateTime,
          false,
        ),
        arrivalTime: deserializeParam(
          data['arrival_time'],
          ParamType.DateTime,
          false,
        ),
        araivalDate: deserializeParam(
          data['araival_date'],
          ParamType.DateTime,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TripViewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TripViewStruct &&
        userId == other.userId &&
        departureDate == other.departureDate &&
        tripsList == other.tripsList &&
        departureTime == other.departureTime &&
        arrivalTime == other.arrivalTime &&
        araivalDate == other.araivalDate &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        departureDate,
        tripsList,
        departureTime,
        arrivalTime,
        araivalDate,
        createdAt
      ]);
}

TripViewStruct createTripViewStruct({
  String? userId,
  DateTime? departureDate,
  TripStruct? tripsList,
  DateTime? departureTime,
  DateTime? arrivalTime,
  DateTime? araivalDate,
  DateTime? createdAt,
}) =>
    TripViewStruct(
      userId: userId,
      departureDate: departureDate,
      tripsList: tripsList ?? TripStruct(),
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      araivalDate: araivalDate,
      createdAt: createdAt,
    );
