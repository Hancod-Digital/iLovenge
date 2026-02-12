import '../database.dart';

class CardsTable extends SupabaseTable<CardsRow> {
  @override
  String get tableName => 'cards';

  @override
  CardsRow createRow(Map<String, dynamic> data) => CardsRow(data);
}

class CardsRow extends SupabaseDataRow {
  CardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cardName => getField<String>('card_name');
  set cardName(String? value) => setField<String>('card_name', value);

  int get cardTypeId => getField<int>('card_type_id')!;
  set cardTypeId(int value) => setField<int>('card_type_id', value);

  int? get cardBankId => getField<int>('card_bank_id');
  set cardBankId(int? value) => setField<int>('card_bank_id', value);

  int? get cardMembershipLevelId => getField<int>('card_membership_level_id');
  set cardMembershipLevelId(int? value) =>
      setField<int>('card_membership_level_id', value);

  int? get cardAirlineId => getField<int>('card_airline_id');
  set cardAirlineId(int? value) => setField<int>('card_airline_id', value);

  String? get cardIcon => getField<String>('card_icon');
  set cardIcon(String? value) => setField<String>('card_icon', value);
}
