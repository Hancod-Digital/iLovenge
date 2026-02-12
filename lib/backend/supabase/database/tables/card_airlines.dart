import '../database.dart';

class CardAirlinesTable extends SupabaseTable<CardAirlinesRow> {
  @override
  String get tableName => 'card_airlines';

  @override
  CardAirlinesRow createRow(Map<String, dynamic> data) => CardAirlinesRow(data);
}

class CardAirlinesRow extends SupabaseDataRow {
  CardAirlinesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardAirlinesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get airlineName => getField<String>('airline_name');
  set airlineName(String? value) => setField<String>('airline_name', value);
}
