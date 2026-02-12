import '../database.dart';

class LoungeReviewsTable extends SupabaseTable<LoungeReviewsRow> {
  @override
  String get tableName => 'lounge_reviews';

  @override
  LoungeReviewsRow createRow(Map<String, dynamic> data) =>
      LoungeReviewsRow(data);
}

class LoungeReviewsRow extends SupabaseDataRow {
  LoungeReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get customerId => getField<String>('customer_id');
  set customerId(String? value) => setField<String>('customer_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  bool? get isActive => getField<bool>('isActive');
  set isActive(bool? value) => setField<bool>('isActive', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  bool get isCardInfo => getField<bool>('is_card_info')!;
  set isCardInfo(bool value) => setField<bool>('is_card_info', value);
}
