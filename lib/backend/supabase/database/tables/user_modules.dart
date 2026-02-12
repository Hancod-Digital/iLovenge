import '../database.dart';

class UserModulesTable extends SupabaseTable<UserModulesRow> {
  @override
  String get tableName => 'user_modules';

  @override
  UserModulesRow createRow(Map<String, dynamic> data) => UserModulesRow(data);
}

class UserModulesRow extends SupabaseDataRow {
  UserModulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserModulesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get moduleName => getField<String>('module_name');
  set moduleName(String? value) => setField<String>('module_name', value);
}
