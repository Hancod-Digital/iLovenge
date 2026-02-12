import '../database.dart';

class UserCardViewTable extends SupabaseTable<UserCardViewRow> {
  @override
  String get tableName => 'user_card_view';

  @override
  UserCardViewRow createRow(Map<String, dynamic> data) => UserCardViewRow(data);
}

class UserCardViewRow extends SupabaseDataRow {
  UserCardViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCardViewTable();

  int? get userCardId => getField<int>('user_card_id');
  set userCardId(int? value) => setField<int>('user_card_id', value);

  DateTime? get addedAt => getField<DateTime>('added_at');
  set addedAt(DateTime? value) => setField<DateTime>('added_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userProfileImage => getField<String>('user_profile_image');
  set userProfileImage(String? value) =>
      setField<String>('user_profile_image', value);

  int? get cardId => getField<int>('card_id');
  set cardId(int? value) => setField<int>('card_id', value);

  String? get cardName => getField<String>('card_name');
  set cardName(String? value) => setField<String>('card_name', value);

  String? get cardBankName => getField<String>('card_bank_name');
  set cardBankName(String? value) => setField<String>('card_bank_name', value);

  String? get cardTypeName => getField<String>('card_type_name');
  set cardTypeName(String? value) => setField<String>('card_type_name', value);

  String? get cardType => getField<String>('card_type');
  set cardType(String? value) => setField<String>('card_type', value);

  String? get cardBank => getField<String>('card_bank');
  set cardBank(String? value) => setField<String>('card_bank', value);

  String? get cardMembershipLevel => getField<String>('card_membership_level');
  set cardMembershipLevel(String? value) =>
      setField<String>('card_membership_level', value);

  String? get cardAirlineName => getField<String>('card_airline_name');
  set cardAirlineName(String? value) =>
      setField<String>('card_airline_name', value);

  int? get cardAirlineId => getField<int>('card_airline_id');
  set cardAirlineId(int? value) => setField<int>('card_airline_id', value);

  String? get cardIcon => getField<String>('card_icon');
  set cardIcon(String? value) => setField<String>('card_icon', value);
}
