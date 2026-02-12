import '../database.dart';

class LoungesViewDuplicateTable extends SupabaseTable<LoungesViewDuplicateRow> {
  @override
  String get tableName => 'lounges_view_duplicate';

  @override
  LoungesViewDuplicateRow createRow(Map<String, dynamic> data) =>
      LoungesViewDuplicateRow(data);
}

class LoungesViewDuplicateRow extends SupabaseDataRow {
  LoungesViewDuplicateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungesViewDuplicateTable();

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  DateTime? get loungeCreatedAt => getField<DateTime>('lounge_created_at');
  set loungeCreatedAt(DateTime? value) =>
      setField<DateTime>('lounge_created_at', value);

  bool? get loungeIsActive => getField<bool>('lounge_is_active');
  set loungeIsActive(bool? value) => setField<bool>('lounge_is_active', value);

  String? get loungeName => getField<String>('lounge_name');
  set loungeName(String? value) => setField<String>('lounge_name', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get airportCode => getField<String>('airport_code');
  set airportCode(String? value) => setField<String>('airport_code', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get verticalImage => getField<String>('vertical_image');
  set verticalImage(String? value) => setField<String>('vertical_image', value);

  List<String> get galleryImages => getListField<String>('gallery_images');
  set galleryImages(List<String>? value) =>
      setListField<String>('gallery_images', value);

  String? get mobileNo => getField<String>('mobile_no');
  set mobileNo(String? value) => setField<String>('mobile_no', value);

  String? get generalEmail => getField<String>('general_email');
  set generalEmail(String? value) => setField<String>('general_email', value);

  bool? get is24Hours => getField<bool>('is_24_hours');
  set is24Hours(bool? value) => setField<bool>('is_24_hours', value);

  dynamic? get timings => getField<dynamic>('timings');
  set timings(dynamic? value) => setField<dynamic>('timings', value);

  dynamic? get amenities => getField<dynamic>('amenities');
  set amenities(dynamic? value) => setField<dynamic>('amenities', value);

  dynamic? get cards => getField<dynamic>('cards');
  set cards(dynamic? value) => setField<dynamic>('cards', value);

  String? get loungeConditions => getField<String>('lounge_conditions');
  set loungeConditions(String? value) =>
      setField<String>('lounge_conditions', value);

  String? get loungeAdditionalInfo =>
      getField<String>('lounge_additional_info');
  set loungeAdditionalInfo(String? value) =>
      setField<String>('lounge_additional_info', value);

  List<String> get adminUserIds => getListField<String>('admin_user_ids');
  set adminUserIds(List<String>? value) =>
      setListField<String>('admin_user_ids', value);

  double? get ratingAvg => getField<double>('rating_avg');
  set ratingAvg(double? value) => setField<double>('rating_avg', value);

  int? get ratingCount => getField<int>('rating_count');
  set ratingCount(int? value) => setField<int>('rating_count', value);

  bool? get isFavourite => getField<bool>('is_favourite');
  set isFavourite(bool? value) => setField<bool>('is_favourite', value);
}
