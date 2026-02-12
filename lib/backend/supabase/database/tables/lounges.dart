import '../database.dart';

class LoungesTable extends SupabaseTable<LoungesRow> {
  @override
  String get tableName => 'lounges';

  @override
  LoungesRow createRow(Map<String, dynamic> data) => LoungesRow(data);
}

class LoungesRow extends SupabaseDataRow {
  LoungesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get isActive => getField<bool>('is_Active')!;
  set isActive(bool value) => setField<bool>('is_Active', value);
}
