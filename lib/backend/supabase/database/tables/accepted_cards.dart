import '../database.dart';

class AcceptedCardsTable extends SupabaseTable<AcceptedCardsRow> {
  @override
  String get tableName => 'accepted_cards';

  @override
  AcceptedCardsRow createRow(Map<String, dynamic> data) =>
      AcceptedCardsRow(data);
}

class AcceptedCardsRow extends SupabaseDataRow {
  AcceptedCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AcceptedCardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get associatedLounge => getField<int>('associated_lounge');
  set associatedLounge(int? value) => setField<int>('associated_lounge', value);
}
