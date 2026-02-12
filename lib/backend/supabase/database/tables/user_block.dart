import '../database.dart';

class UserBlockTable extends SupabaseTable<UserBlockRow> {
  @override
  String get tableName => 'user_block';

  @override
  UserBlockRow createRow(Map<String, dynamic> data) => UserBlockRow(data);
}

class UserBlockRow extends SupabaseDataRow {
  UserBlockRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBlockTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get blockedUser => getField<String>('blocked_user');
  set blockedUser(String? value) => setField<String>('blocked_user', value);
}
