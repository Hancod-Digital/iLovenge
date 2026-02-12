import '../database.dart';

class UserFeedbacksTable extends SupabaseTable<UserFeedbacksRow> {
  @override
  String get tableName => 'user_feedbacks';

  @override
  UserFeedbacksRow createRow(Map<String, dynamic> data) =>
      UserFeedbacksRow(data);
}

class UserFeedbacksRow extends SupabaseDataRow {
  UserFeedbacksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFeedbacksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  String get feedbackContent => getField<String>('feedback_content')!;
  set feedbackContent(String value) =>
      setField<String>('feedback_content', value);

  bool get isActive => getField<bool>('isActive')!;
  set isActive(bool value) => setField<bool>('isActive', value);

  double? get stars => getField<double>('stars');
  set stars(double? value) => setField<double>('stars', value);
}
