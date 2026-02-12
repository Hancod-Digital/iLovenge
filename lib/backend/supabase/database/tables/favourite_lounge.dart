import '../database.dart';

class FavouriteLoungeTable extends SupabaseTable<FavouriteLoungeRow> {
  @override
  String get tableName => 'favourite_lounge';

  @override
  FavouriteLoungeRow createRow(Map<String, dynamic> data) =>
      FavouriteLoungeRow(data);
}

class FavouriteLoungeRow extends SupabaseDataRow {
  FavouriteLoungeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteLoungeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get loungeId => getField<int>('lounge_id')!;
  set loungeId(int value) => setField<int>('lounge_id', value);
}
