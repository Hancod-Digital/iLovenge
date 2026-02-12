import '../database.dart';

class TripsViewTable extends SupabaseTable<TripsViewRow> {
  @override
  String get tableName => 'trips_view';

  @override
  TripsViewRow createRow(Map<String, dynamic> data) => TripsViewRow(data);
}

class TripsViewRow extends SupabaseDataRow {
  TripsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripsViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get departureDate => getField<DateTime>('departure_date');
  set departureDate(DateTime? value) =>
      setField<DateTime>('departure_date', value);

  PostgresTime? get departureTime => getField<PostgresTime>('departure_time');
  set departureTime(PostgresTime? value) =>
      setField<PostgresTime>('departure_time', value);

  PostgresTime? get arrivalTime => getField<PostgresTime>('arrival_time');
  set arrivalTime(PostgresTime? value) =>
      setField<PostgresTime>('arrival_time', value);

  DateTime? get araivalDate => getField<DateTime>('araival_date');
  set araivalDate(DateTime? value) => setField<DateTime>('araival_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  dynamic? get tripsList => getField<dynamic>('trips_list');
  set tripsList(dynamic? value) => setField<dynamic>('trips_list', value);
}
