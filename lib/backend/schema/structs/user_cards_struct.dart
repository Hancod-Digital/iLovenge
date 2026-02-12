// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCardsStruct extends BaseStruct {
  UserCardsStruct({
    int? cardId,
    String? cardName,
    int? cardBankId,
    int? cardTypeId,
    String? cardBankName,
    String? cardTypeName,
    String? cardCreatedAt,
    int? userCardsId,
  })  : _cardId = cardId,
        _cardName = cardName,
        _cardBankId = cardBankId,
        _cardTypeId = cardTypeId,
        _cardBankName = cardBankName,
        _cardTypeName = cardTypeName,
        _cardCreatedAt = cardCreatedAt,
        _userCardsId = userCardsId;

  // "card_id" field.
  int? _cardId;
  int get cardId => _cardId ?? 0;
  set cardId(int? val) => _cardId = val;

  void incrementCardId(int amount) => cardId = cardId + amount;

  bool hasCardId() => _cardId != null;

  // "card_name" field.
  String? _cardName;
  String get cardName => _cardName ?? '';
  set cardName(String? val) => _cardName = val;

  bool hasCardName() => _cardName != null;

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

  // "card_bank_name" field.
  String? _cardBankName;
  String get cardBankName => _cardBankName ?? '';
  set cardBankName(String? val) => _cardBankName = val;

  bool hasCardBankName() => _cardBankName != null;

  // "card_type_name" field.
  String? _cardTypeName;
  String get cardTypeName => _cardTypeName ?? '';
  set cardTypeName(String? val) => _cardTypeName = val;

  bool hasCardTypeName() => _cardTypeName != null;

  // "card_created_at" field.
  String? _cardCreatedAt;
  String get cardCreatedAt => _cardCreatedAt ?? '';
  set cardCreatedAt(String? val) => _cardCreatedAt = val;

  bool hasCardCreatedAt() => _cardCreatedAt != null;

  // "user_cards_id" field.
  int? _userCardsId;
  int get userCardsId => _userCardsId ?? 0;
  set userCardsId(int? val) => _userCardsId = val;

  void incrementUserCardsId(int amount) => userCardsId = userCardsId + amount;

  bool hasUserCardsId() => _userCardsId != null;

  static UserCardsStruct fromMap(Map<String, dynamic> data) => UserCardsStruct(
        cardId: castToType<int>(data['card_id']),
        cardName: data['card_name'] as String?,
        cardBankId: castToType<int>(data['card_bank_id']),
        cardTypeId: castToType<int>(data['card_type_id']),
        cardBankName: data['card_bank_name'] as String?,
        cardTypeName: data['card_type_name'] as String?,
        cardCreatedAt: data['card_created_at'] as String?,
        userCardsId: castToType<int>(data['user_cards_id']),
      );

  static UserCardsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCardsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'card_id': _cardId,
        'card_name': _cardName,
        'card_bank_id': _cardBankId,
        'card_type_id': _cardTypeId,
        'card_bank_name': _cardBankName,
        'card_type_name': _cardTypeName,
        'card_created_at': _cardCreatedAt,
        'user_cards_id': _userCardsId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'card_id': serializeParam(
          _cardId,
          ParamType.int,
        ),
        'card_name': serializeParam(
          _cardName,
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
        'card_bank_name': serializeParam(
          _cardBankName,
          ParamType.String,
        ),
        'card_type_name': serializeParam(
          _cardTypeName,
          ParamType.String,
        ),
        'card_created_at': serializeParam(
          _cardCreatedAt,
          ParamType.String,
        ),
        'user_cards_id': serializeParam(
          _userCardsId,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserCardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCardsStruct(
        cardId: deserializeParam(
          data['card_id'],
          ParamType.int,
          false,
        ),
        cardName: deserializeParam(
          data['card_name'],
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
        cardBankName: deserializeParam(
          data['card_bank_name'],
          ParamType.String,
          false,
        ),
        cardTypeName: deserializeParam(
          data['card_type_name'],
          ParamType.String,
          false,
        ),
        cardCreatedAt: deserializeParam(
          data['card_created_at'],
          ParamType.String,
          false,
        ),
        userCardsId: deserializeParam(
          data['user_cards_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserCardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCardsStruct &&
        cardId == other.cardId &&
        cardName == other.cardName &&
        cardBankId == other.cardBankId &&
        cardTypeId == other.cardTypeId &&
        cardBankName == other.cardBankName &&
        cardTypeName == other.cardTypeName &&
        cardCreatedAt == other.cardCreatedAt &&
        userCardsId == other.userCardsId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cardId,
        cardName,
        cardBankId,
        cardTypeId,
        cardBankName,
        cardTypeName,
        cardCreatedAt,
        userCardsId
      ]);
}

UserCardsStruct createUserCardsStruct({
  int? cardId,
  String? cardName,
  int? cardBankId,
  int? cardTypeId,
  String? cardBankName,
  String? cardTypeName,
  String? cardCreatedAt,
  int? userCardsId,
}) =>
    UserCardsStruct(
      cardId: cardId,
      cardName: cardName,
      cardBankId: cardBankId,
      cardTypeId: cardTypeId,
      cardBankName: cardBankName,
      cardTypeName: cardTypeName,
      cardCreatedAt: cardCreatedAt,
      userCardsId: userCardsId,
    );
