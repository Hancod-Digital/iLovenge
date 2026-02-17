import '../database.dart';

class TripsTable extends SupabaseTable<TripsRow> {
  @override
  String get tableName => 'trips';

  @override
  TripsRow createRow(Map<String, dynamic> data) => TripsRow(data);
}

class TripsRow extends SupabaseDataRow {
  TripsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get pnrNumber => getField<String>('pnr_number')!;
  set pnrNumber(String value) => setField<String>('pnr_number', value);

  DateTime get departureDate => getField<DateTime>('departure_date')!;
  set departureDate(DateTime value) =>
      setField<DateTime>('departure_date', value);

  String get airline => getField<String>('airline')!;
  set airline(String value) => setField<String>('airline', value);

  String get flightNumber => getField<String>('flight_number')!;
  set flightNumber(String value) => setField<String>('flight_number', value);

  String? get flightClass => getField<String>('flight_class');
  set flightClass(String? value) => setField<String>('flight_class', value);

  String get departureAirport => getField<String>('departure_airport')!;
  set departureAirport(String value) =>
      setField<String>('departure_airport', value);

  PostgresTime get departureTime => getField<PostgresTime>('departure_time')!;
  set departureTime(PostgresTime value) =>
      setField<PostgresTime>('departure_time', value);

  String? get departureTimezone => getField<String>('departure_timezone');
  set departureTimezone(String? value) =>
      setField<String>('departure_timezone', value);

  String? get departureTerminal => getField<String>('departure_terminal');
  set departureTerminal(String? value) =>
      setField<String>('departure_terminal', value);

  String? get seat => getField<String>('seat');
  set seat(String? value) => setField<String>('seat', value);

  String? get gateNumber => getField<String>('gate_number');
  set gateNumber(String? value) => setField<String>('gate_number', value);

  String? get belt => getField<String>('belt');
  set belt(String? value) => setField<String>('belt', value);

  String get arrivalAirport => getField<String>('arrival_airport')!;
  set arrivalAirport(String value) =>
      setField<String>('arrival_airport', value);

  PostgresTime get arrivalTime => getField<PostgresTime>('arrival_time')!;
  set arrivalTime(PostgresTime value) =>
      setField<PostgresTime>('arrival_time', value);

  String? get arrivalTimezone => getField<String>('arrival_timezone');
  set arrivalTimezone(String? value) =>
      setField<String>('arrival_timezone', value);

  String? get arrivalTerminal => getField<String>('arrival_terminal');
  set arrivalTerminal(String? value) =>
      setField<String>('arrival_terminal', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get araivalDate => getField<DateTime>('araival_date');
  set araivalDate(DateTime? value) => setField<DateTime>('araival_date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String get tripType => getField<String>('trip_type')!;
  set tripType(String value) => setField<String>('trip_type', value);

  String? get roundTripId => getField<String>('round_trip_id');
  set roundTripId(String? value) => setField<String>('round_trip_id', value);

  String? get arrivalAirportName => getField<String>('arrival_airport_name');
  set arrivalAirportName(String? value) =>
      setField<String>('arrival_airport_name', value);

  String? get departureAirportName =>
      getField<String>('departure_airport_name');
  set departureAirportName(String? value) =>
      setField<String>('departure_airport_name', value);

  DateTime? get arrivalAt => getField<DateTime>('arrival_at');
  set arrivalAt(DateTime? value) => setField<DateTime>('arrival_at', value);

  DateTime? get departureAt => getField<DateTime>('departure_at');
  set departureAt(DateTime? value) => setField<DateTime>('departure_at', value);
}
