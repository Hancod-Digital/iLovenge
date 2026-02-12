import '../database.dart';

class CardBanksTable extends SupabaseTable<CardBanksRow> {
  @override
  String get tableName => 'card_banks';

  @override
  CardBanksRow createRow(Map<String, dynamic> data) => CardBanksRow(data);
}

class CardBanksRow extends SupabaseDataRow {
  CardBanksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardBanksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get bankName => getField<String>('bank_name')!;
  set bankName(String value) => setField<String>('bank_name', value);

  int get cardTypeId => getField<int>('card_type_id')!;
  set cardTypeId(int value) => setField<int>('card_type_id', value);
}
