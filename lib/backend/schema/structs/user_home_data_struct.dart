// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserHomeDataStruct extends BaseStruct {
  UserHomeDataStruct({
    List<TripNowStruct>? tripNow,
    UserNowStruct? userNow,
    List<UserCardsStruct>? userCards,
    List<LoungesNowStruct>? loungesNow,
  })  : _tripNow = tripNow,
        _userNow = userNow,
        _userCards = userCards,
        _loungesNow = loungesNow;

  // "tripNow" field.
  List<TripNowStruct>? _tripNow;
  List<TripNowStruct> get tripNow => _tripNow ?? const [];
  set tripNow(List<TripNowStruct>? val) => _tripNow = val;

  void updateTripNow(Function(List<TripNowStruct>) updateFn) {
    updateFn(_tripNow ??= []);
  }

  bool hasTripNow() => _tripNow != null;

  // "userNow" field.
  UserNowStruct? _userNow;
  UserNowStruct get userNow => _userNow ?? UserNowStruct();
  set userNow(UserNowStruct? val) => _userNow = val;

  void updateUserNow(Function(UserNowStruct) updateFn) {
    updateFn(_userNow ??= UserNowStruct());
  }

  bool hasUserNow() => _userNow != null;

  // "userCards" field.
  List<UserCardsStruct>? _userCards;
  List<UserCardsStruct> get userCards => _userCards ?? const [];
  set userCards(List<UserCardsStruct>? val) => _userCards = val;

  void updateUserCards(Function(List<UserCardsStruct>) updateFn) {
    updateFn(_userCards ??= []);
  }

  bool hasUserCards() => _userCards != null;

  // "loungesNow" field.
  List<LoungesNowStruct>? _loungesNow;
  List<LoungesNowStruct> get loungesNow => _loungesNow ?? const [];
  set loungesNow(List<LoungesNowStruct>? val) => _loungesNow = val;

  void updateLoungesNow(Function(List<LoungesNowStruct>) updateFn) {
    updateFn(_loungesNow ??= []);
  }

  bool hasLoungesNow() => _loungesNow != null;

  static UserHomeDataStruct fromMap(Map<String, dynamic> data) =>
      UserHomeDataStruct(
        tripNow: getStructList(
          data['tripNow'],
          TripNowStruct.fromMap,
        ),
        userNow: data['userNow'] is UserNowStruct
            ? data['userNow']
            : UserNowStruct.maybeFromMap(data['userNow']),
        userCards: getStructList(
          data['userCards'],
          UserCardsStruct.fromMap,
        ),
        loungesNow: getStructList(
          data['loungesNow'],
          LoungesNowStruct.fromMap,
        ),
      );

  static UserHomeDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserHomeDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tripNow': _tripNow?.map((e) => e.toMap()).toList(),
        'userNow': _userNow?.toMap(),
        'userCards': _userCards?.map((e) => e.toMap()).toList(),
        'loungesNow': _loungesNow?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tripNow': serializeParam(
          _tripNow,
          ParamType.DataStruct,
          isList: true,
        ),
        'userNow': serializeParam(
          _userNow,
          ParamType.DataStruct,
        ),
        'userCards': serializeParam(
          _userCards,
          ParamType.DataStruct,
          isList: true,
        ),
        'loungesNow': serializeParam(
          _loungesNow,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserHomeDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserHomeDataStruct(
        tripNow: deserializeStructParam<TripNowStruct>(
          data['tripNow'],
          ParamType.DataStruct,
          true,
          structBuilder: TripNowStruct.fromSerializableMap,
        ),
        userNow: deserializeStructParam(
          data['userNow'],
          ParamType.DataStruct,
          false,
          structBuilder: UserNowStruct.fromSerializableMap,
        ),
        userCards: deserializeStructParam<UserCardsStruct>(
          data['userCards'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCardsStruct.fromSerializableMap,
        ),
        loungesNow: deserializeStructParam<LoungesNowStruct>(
          data['loungesNow'],
          ParamType.DataStruct,
          true,
          structBuilder: LoungesNowStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserHomeDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserHomeDataStruct &&
        listEquality.equals(tripNow, other.tripNow) &&
        userNow == other.userNow &&
        listEquality.equals(userCards, other.userCards) &&
        listEquality.equals(loungesNow, other.loungesNow);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tripNow, userNow, userCards, loungesNow]);
}

UserHomeDataStruct createUserHomeDataStruct({
  UserNowStruct? userNow,
}) =>
    UserHomeDataStruct(
      userNow: userNow ?? UserNowStruct(),
    );
