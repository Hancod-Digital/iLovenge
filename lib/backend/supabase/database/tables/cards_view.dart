import '../database.dart';

class CardsViewTable extends SupabaseTable<CardsViewRow> {
  @override
  String get tableName => 'cards_view';

  @override
  CardsViewRow createRow(Map<String, dynamic> data) => CardsViewRow(data);
}

class CardsViewRow extends SupabaseDataRow {
  CardsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardsViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get cardName => getField<String>('card_name');
  set cardName(String? value) => setField<String>('card_name', value);

  String? get cardType => getField<String>('card_type');
  set cardType(String? value) => setField<String>('card_type', value);

  int? get cardTypeId => getField<int>('card_type_id');
  set cardTypeId(int? value) => setField<int>('card_type_id', value);

  String? get cardBank => getField<String>('card_bank');
  set cardBank(String? value) => setField<String>('card_bank', value);

  int? get cardBankId => getField<int>('card_bank_id');
  set cardBankId(int? value) => setField<int>('card_bank_id', value);

  String? get cardMembershipLevel => getField<String>('card_membership_level');
  set cardMembershipLevel(String? value) =>
      setField<String>('card_membership_level', value);

  int? get cardMembershipLevelId => getField<int>('card_membership_level_id');
  set cardMembershipLevelId(int? value) =>
      setField<int>('card_membership_level_id', value);

  String? get cardAirlineName => getField<String>('card_airline_name');
  set cardAirlineName(String? value) =>
      setField<String>('card_airline_name', value);

  int? get cardAirlineId => getField<int>('card_airline_id');
  set cardAirlineId(int? value) => setField<int>('card_airline_id', value);

  String? get cardIcon => getField<String>('card_icon');
  set cardIcon(String? value) => setField<String>('card_icon', value);
}
