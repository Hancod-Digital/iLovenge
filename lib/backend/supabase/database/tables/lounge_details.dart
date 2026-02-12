import '../database.dart';

class LoungeDetailsTable extends SupabaseTable<LoungeDetailsRow> {
  @override
  String get tableName => 'lounge_details';

  @override
  LoungeDetailsRow createRow(Map<String, dynamic> data) =>
      LoungeDetailsRow(data);
}

class LoungeDetailsRow extends SupabaseDataRow {
  LoungeDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeDetailsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get loungeName => getField<String>('lounge_name')!;
  set loungeName(String value) => setField<String>('lounge_name', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);

  String get airportCode => getField<String>('airport_code')!;
  set airportCode(String value) => setField<String>('airport_code', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String get verticalImage => getField<String>('vertical_image')!;
  set verticalImage(String value) => setField<String>('vertical_image', value);

  List<String> get galleryImages => getListField<String>('gallery_images');
  set galleryImages(List<String>? value) =>
      setListField<String>('gallery_images', value);

  String? get mobileNo => getField<String>('mobile_no');
  set mobileNo(String? value) => setField<String>('mobile_no', value);

  String? get generalEmail => getField<String>('general_email');
  set generalEmail(String? value) => setField<String>('general_email', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  String? get mobileCode => getField<String>('mobile_code');
  set mobileCode(String? value) => setField<String>('mobile_code', value);
}
