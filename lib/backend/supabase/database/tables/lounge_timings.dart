import '../database.dart';

class LoungeTimingsTable extends SupabaseTable<LoungeTimingsRow> {
  @override
  String get tableName => 'lounge_timings';

  @override
  LoungeTimingsRow createRow(Map<String, dynamic> data) =>
      LoungeTimingsRow(data);
}

class LoungeTimingsRow extends SupabaseDataRow {
  LoungeTimingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeTimingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get loungeId => getField<int>('lounge_id')!;
  set loungeId(int value) => setField<int>('lounge_id', value);

  bool get is24Hours => getField<bool>('is_24_hours')!;
  set is24Hours(bool value) => setField<bool>('is_24_hours', value);

  dynamic? get timings => getField<dynamic>('timings');
  set timings(dynamic? value) => setField<dynamic>('timings', value);
}
