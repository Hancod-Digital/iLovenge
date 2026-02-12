import '../database.dart';

class LoungeAmenitiesTable extends SupabaseTable<LoungeAmenitiesRow> {
  @override
  String get tableName => 'lounge_amenities';

  @override
  LoungeAmenitiesRow createRow(Map<String, dynamic> data) =>
      LoungeAmenitiesRow(data);
}

class LoungeAmenitiesRow extends SupabaseDataRow {
  LoungeAmenitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeAmenitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  int? get amenitieId => getField<int>('amenitie_id');
  set amenitieId(int? value) => setField<int>('amenitie_id', value);
}
