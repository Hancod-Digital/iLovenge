import '../database.dart';

class UserRoleViewTable extends SupabaseTable<UserRoleViewRow> {
  @override
  String get tableName => 'user_role_view';

  @override
  UserRoleViewRow createRow(Map<String, dynamic> data) => UserRoleViewRow(data);
}

class UserRoleViewRow extends SupabaseDataRow {
  UserRoleViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRoleViewTable();

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);

  DateTime? get roleCreatedAt => getField<DateTime>('role_created_at');
  set roleCreatedAt(DateTime? value) =>
      setField<DateTime>('role_created_at', value);

  String? get roleName => getField<String>('role_name');
  set roleName(String? value) => setField<String>('role_name', value);

  int? get permissionUserRole => getField<int>('permission_user_role');
  set permissionUserRole(int? value) =>
      setField<int>('permission_user_role', value);

  int? get permission => getField<int>('permission');
  set permission(int? value) => setField<int>('permission', value);

  String? get permissionName => getField<String>('permission_name');
  set permissionName(String? value) =>
      setField<String>('permission_name', value);

  DateTime? get permissionCreatedAt =>
      getField<DateTime>('permission_created_at');
  set permissionCreatedAt(DateTime? value) =>
      setField<DateTime>('permission_created_at', value);

  int? get moduleId => getField<int>('module_id');
  set moduleId(int? value) => setField<int>('module_id', value);

  String? get moduleName => getField<String>('module_name');
  set moduleName(String? value) => setField<String>('module_name', value);
}
