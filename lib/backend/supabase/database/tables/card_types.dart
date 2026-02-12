import '../database.dart';

class CardTypesTable extends SupabaseTable<CardTypesRow> {
  @override
  String get tableName => 'card_types';

  @override
  CardTypesRow createRow(Map<String, dynamic> data) => CardTypesRow(data);
}

class CardTypesRow extends SupabaseDataRow {
  CardTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
