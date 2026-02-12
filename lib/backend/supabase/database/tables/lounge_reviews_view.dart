import '../database.dart';

class LoungeReviewsViewTable extends SupabaseTable<LoungeReviewsViewRow> {
  @override
  String get tableName => 'lounge_reviews_view';

  @override
  LoungeReviewsViewRow createRow(Map<String, dynamic> data) =>
      LoungeReviewsViewRow(data);
}

class LoungeReviewsViewRow extends SupabaseDataRow {
  LoungeReviewsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeReviewsViewTable();

  int? get reviewId => getField<int>('review_id');
  set reviewId(int? value) => setField<int>('review_id', value);

  DateTime? get reviewCreatedAt => getField<DateTime>('review_created_at');
  set reviewCreatedAt(DateTime? value) =>
      setField<DateTime>('review_created_at', value);

  String? get customerId => getField<String>('customer_id');
  set customerId(String? value) => setField<String>('customer_id', value);

  String? get customerName => getField<String>('customer_name');
  set customerName(String? value) => setField<String>('customer_name', value);

  String? get customerProfileImage =>
      getField<String>('customer_profile_image');
  set customerProfileImage(String? value) =>
      setField<String>('customer_profile_image', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  String? get reviewContent => getField<String>('review_content');
  set reviewContent(String? value) => setField<String>('review_content', value);

  bool? get reviewIsActive => getField<bool>('review_is_active');
  set reviewIsActive(bool? value) => setField<bool>('review_is_active', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  bool? get isCardInfo => getField<bool>('is_card_info');
  set isCardInfo(bool? value) => setField<bool>('is_card_info', value);
}
