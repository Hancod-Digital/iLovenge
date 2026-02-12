import '../database.dart';

class LoungeAdminsTable extends SupabaseTable<LoungeAdminsRow> {
  @override
  String get tableName => 'lounge_admins';

  @override
  LoungeAdminsRow createRow(Map<String, dynamic> data) => LoungeAdminsRow(data);
}

class LoungeAdminsRow extends SupabaseDataRow {
  LoungeAdminsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeAdminsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);
}
