import '../database.dart';

class UserFeedbacksViewTable extends SupabaseTable<UserFeedbacksViewRow> {
  @override
  String get tableName => 'user_feedbacks_view';

  @override
  UserFeedbacksViewRow createRow(Map<String, dynamic> data) =>
      UserFeedbacksViewRow(data);
}

class UserFeedbacksViewRow extends SupabaseDataRow {
  UserFeedbacksViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFeedbacksViewTable();

  int? get feedbackId => getField<int>('feedback_id');
  set feedbackId(int? value) => setField<int>('feedback_id', value);

  DateTime? get feedbackCreatedAt => getField<DateTime>('feedback_created_at');
  set feedbackCreatedAt(DateTime? value) =>
      setField<DateTime>('feedback_created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userProfileImage => getField<String>('user_profile_image');
  set userProfileImage(String? value) =>
      setField<String>('user_profile_image', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  String? get feedbackContent => getField<String>('feedback_content');
  set feedbackContent(String? value) =>
      setField<String>('feedback_content', value);

  bool? get feedbackIsActive => getField<bool>('feedback_is_active');
  set feedbackIsActive(bool? value) =>
      setField<bool>('feedback_is_active', value);

  double? get stars => getField<double>('stars');
  set stars(double? value) => setField<double>('stars', value);
}
