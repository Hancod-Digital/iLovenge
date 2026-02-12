import '../database.dart';

class UserViewTable extends SupabaseTable<UserViewRow> {
  @override
  String get tableName => 'user_view';

  @override
  UserViewRow createRow(Map<String, dynamic> data) => UserViewRow(data);
}

class UserViewRow extends SupabaseDataRow {
  UserViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get userCreatedAt => getField<DateTime>('user_created_at');
  set userCreatedAt(DateTime? value) =>
      setField<DateTime>('user_created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get profileUrl => getField<String>('profile_url');
  set profileUrl(String? value) => setField<String>('profile_url', value);

  int? get userRole => getField<int>('user_role');
  set userRole(int? value) => setField<int>('user_role', value);

  DateTime? get dateOfBirth => getField<DateTime>('date_of_birth');
  set dateOfBirth(DateTime? value) =>
      setField<DateTime>('date_of_birth', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  dynamic? get cards => getField<dynamic>('cards');
  set cards(dynamic? value) => setField<dynamic>('cards', value);

  String? get dashboardMessage => getField<String>('dashboard_message');
  set dashboardMessage(String? value) =>
      setField<String>('dashboard_message', value);
}
