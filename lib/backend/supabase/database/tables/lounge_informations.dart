import '../database.dart';

class LoungeInformationsTable extends SupabaseTable<LoungeInformationsRow> {
  @override
  String get tableName => 'lounge_informations';

  @override
  LoungeInformationsRow createRow(Map<String, dynamic> data) =>
      LoungeInformationsRow(data);
}

class LoungeInformationsRow extends SupabaseDataRow {
  LoungeInformationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeInformationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get loungeId => getField<int>('lounge_id');
  set loungeId(int? value) => setField<int>('lounge_id', value);

  String? get loungeConditions => getField<String>('lounge_conditions');
  set loungeConditions(String? value) =>
      setField<String>('lounge_conditions', value);

  String? get loungeAdditionalInfo =>
      getField<String>('lounge_additional_info');
  set loungeAdditionalInfo(String? value) =>
      setField<String>('lounge_additional_info', value);
}
