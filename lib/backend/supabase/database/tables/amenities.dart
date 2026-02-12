import '../database.dart';

class AmenitiesTable extends SupabaseTable<AmenitiesRow> {
  @override
  String get tableName => 'amenities';

  @override
  AmenitiesRow createRow(Map<String, dynamic> data) => AmenitiesRow(data);
}

class AmenitiesRow extends SupabaseDataRow {
  AmenitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AmenitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get amenitieLabel => getField<String>('amenitie_label')!;
  set amenitieLabel(String value) => setField<String>('amenitie_label', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);
}
