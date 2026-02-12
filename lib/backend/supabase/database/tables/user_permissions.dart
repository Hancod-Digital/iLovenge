import '../database.dart';

class UserPermissionsTable extends SupabaseTable<UserPermissionsRow> {
  @override
  String get tableName => 'user_permissions';

  @override
  UserPermissionsRow createRow(Map<String, dynamic> data) =>
      UserPermissionsRow(data);
}

class UserPermissionsRow extends SupabaseDataRow {
  UserPermissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPermissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
