// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardsStruct extends BaseStruct {
  CardsStruct({
    int? cardId,
    String? cardBank,
    String? cardName,
    String? cardType,
    int? cardBankId,
    int? cardTypeId,
    int? cardAirlineId,
    String? cardAirlineName,
    String? cardMembershipLevel,
    int? cardMembershipLevelId,
  })  : _cardId = cardId,
        _cardBank = cardBank,
        _cardName = cardName,
        _cardType = cardType,
        _cardBankId = cardBankId,
        _cardTypeId = cardTypeId,
        _cardAirlineId = cardAirlineId,
        _cardAirlineName = cardAirlineName,
        _cardMembershipLevel = cardMembershipLevel,
        _cardMembershipLevelId = cardMembershipLevelId;

  // "card_id" field.
  int? _cardId;
  int get cardId => _cardId ?? 0;
  set cardId(int? val) => _cardId = val;

  void incrementCardId(int amount) => cardId = cardId + amount;

  bool hasCardId() => _cardId != null;

  // "card_bank" field.
  String? _cardBank;
  String get cardBank => _cardBank ?? '';
  set cardBank(String? val) => _cardBank = val;

  bool hasCardBank() => _cardBank != null;

  // "card_name" field.
  String? _cardName;
  String get cardName => _cardName ?? '';
  set cardName(String? val) => _cardName = val;

  bool hasCardName() => _cardName != null;

  // "card_type" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  set cardType(String? val) => _cardType = val;

  bool hasCardType() => _cardType != null;

  // "card_bank_id" field.
  int? _cardBankId;
  int get cardBankId => _cardBankId ?? 0;
  set cardBankId(int? val) => _cardBankId = val;

  void incrementCardBankId(int amount) => cardBankId = cardBankId + amount;

  bool hasCardBankId() => _cardBankId != null;

  // "card_type_id" field.
  int? _cardTypeId;
  int get cardTypeId => _cardTypeId ?? 0;
  set cardTypeId(int? val) => _cardTypeId = val;

  void incrementCardTypeId(int amount) => cardTypeId = cardTypeId + amount;

  bool hasCardTypeId() => _cardTypeId != null;

  // "card_airline_id" field.
  int? _cardAirlineId;
  int get cardAirlineId => _cardAirlineId ?? 0;
  set cardAirlineId(int? val) => _cardAirlineId = val;

  void incrementCardAirlineId(int amount) =>
      cardAirlineId = cardAirlineId + amount;

  bool hasCardAirlineId() => _cardAirlineId != null;

  // "card_airline_name" field.
  String? _cardAirlineName;
  String get cardAirlineName => _cardAirlineName ?? '';
  set cardAirlineName(String? val) => _cardAirlineName = val;

  bool hasCardAirlineName() => _cardAirlineName != null;

  // "card_membership_level" field.
  String? _cardMembershipLevel;
  String get cardMembershipLevel => _cardMembershipLevel ?? '';
  set cardMembershipLevel(String? val) => _cardMembershipLevel = val;

  bool hasCardMembershipLevel() => _cardMembershipLevel != null;

  // "card_membership_level_id" field.
  int? _cardMembershipLevelId;
  int get cardMembershipLevelId => _cardMembershipLevelId ?? 0;
  set cardMembershipLevelId(int? val) => _cardMembershipLevelId = val;

  void incrementCardMembershipLevelId(int amount) =>
      cardMembershipLevelId = cardMembershipLevelId + amount;

  bool hasCardMembershipLevelId() => _cardMembershipLevelId != null;

  static CardsStruct fromMap(Map<String, dynamic> data) => CardsStruct(
        cardId: castToType<int>(data['card_id']),
        cardBank: data['card_bank'] as String?,
        cardName: data['card_name'] as String?,
        cardType: data['card_type'] as String?,
        cardBankId: castToType<int>(data['card_bank_id']),
        cardTypeId: castToType<int>(data['card_type_id']),
        cardAirlineId: castToType<int>(data['card_airline_id']),
        cardAirlineName: data['card_airline_name'] as String?,
        cardMembershipLevel: data['card_membership_level'] as String?,
        cardMembershipLevelId:
            castToType<int>(data['card_membership_level_id']),
      );

  static CardsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'card_id': _cardId,
        'card_bank': _cardBank,
        'card_name': _cardName,
        'card_type': _cardType,
        'card_bank_id': _cardBankId,
        'card_type_id': _cardTypeId,
        'card_airline_id': _cardAirlineId,
        'card_airline_name': _cardAirlineName,
        'card_membership_level': _cardMembershipLevel,
        'card_membership_level_id': _cardMembershipLevelId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'card_id': serializeParam(
          _cardId,
          ParamType.int,
        ),
        'card_bank': serializeParam(
          _cardBank,
          ParamType.String,
        ),
        'card_name': serializeParam(
          _cardName,
          ParamType.String,
        ),
        'card_type': serializeParam(
          _cardType,
          ParamType.String,
        ),
        'card_bank_id': serializeParam(
          _cardBankId,
          ParamType.int,
        ),
        'card_type_id': serializeParam(
          _cardTypeId,
          ParamType.int,
        ),
        'card_airline_id': serializeParam(
          _cardAirlineId,
          ParamType.int,
        ),
        'card_airline_name': serializeParam(
          _cardAirlineName,
          ParamType.String,
        ),
        'card_membership_level': serializeParam(
          _cardMembershipLevel,
          ParamType.String,
        ),
        'card_membership_level_id': serializeParam(
          _cardMembershipLevelId,
          ParamType.int,
        ),
      }.withoutNulls;

  static CardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardsStruct(
        cardId: deserializeParam(
          data['card_id'],
          ParamType.int,
          false,
        ),
        cardBank: deserializeParam(
          data['card_bank'],
          ParamType.String,
          false,
        ),
        cardName: deserializeParam(
          data['card_name'],
          ParamType.String,
          false,
        ),
        cardType: deserializeParam(
          data['card_type'],
          ParamType.String,
          false,
        ),
        cardBankId: deserializeParam(
          data['card_bank_id'],
          ParamType.int,
          false,
        ),
        cardTypeId: deserializeParam(
          data['card_type_id'],
          ParamType.int,
          false,
        ),
        cardAirlineId: deserializeParam(
          data['card_airline_id'],
          ParamType.int,
          false,
        ),
        cardAirlineName: deserializeParam(
          data['card_airline_name'],
          ParamType.String,
          false,
        ),
        cardMembershipLevel: deserializeParam(
          data['card_membership_level'],
          ParamType.String,
          false,
        ),
        cardMembershipLevelId: deserializeParam(
          data['card_membership_level_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardsStruct &&
        cardId == other.cardId &&
        cardBank == other.cardBank &&
        cardName == other.cardName &&
        cardType == other.cardType &&
        cardBankId == other.cardBankId &&
        cardTypeId == other.cardTypeId &&
        cardAirlineId == other.cardAirlineId &&
        cardAirlineName == other.cardAirlineName &&
        cardMembershipLevel == other.cardMembershipLevel &&
        cardMembershipLevelId == other.cardMembershipLevelId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cardId,
        cardBank,
        cardName,
        cardType,
        cardBankId,
        cardTypeId,
        cardAirlineId,
        cardAirlineName,
        cardMembershipLevel,
        cardMembershipLevelId
      ]);
}

CardsStruct createCardsStruct({
  int? cardId,
  String? cardBank,
  String? cardName,
  String? cardType,
  int? cardBankId,
  int? cardTypeId,
  int? cardAirlineId,
  String? cardAirlineName,
  String? cardMembershipLevel,
  int? cardMembershipLevelId,
}) =>
    CardsStruct(
      cardId: cardId,
      cardBank: cardBank,
      cardName: cardName,
      cardType: cardType,
      cardBankId: cardBankId,
      cardTypeId: cardTypeId,
      cardAirlineId: cardAirlineId,
      cardAirlineName: cardAirlineName,
      cardMembershipLevel: cardMembershipLevel,
      cardMembershipLevelId: cardMembershipLevelId,
    );
