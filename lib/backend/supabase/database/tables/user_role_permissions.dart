import '../database.dart';

class UserRolePermissionsTable extends SupabaseTable<UserRolePermissionsRow> {
  @override
  String get tableName => 'user_role_permissions';

  @override
  UserRolePermissionsRow createRow(Map<String, dynamic> data) =>
      UserRolePermissionsRow(data);
}

class UserRolePermissionsRow extends SupabaseDataRow {
  UserRolePermissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRolePermissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userRole => getField<int>('user_role');
  set userRole(int? value) => setField<int>('user_role', value);

  int? get permission => getField<int>('permission');
  set permission(int? value) => setField<int>('permission', value);

  int? get module => getField<int>('module');
  set module(int? value) => setField<int>('module', value);
}
