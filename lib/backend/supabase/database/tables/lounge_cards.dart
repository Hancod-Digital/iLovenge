import '../database.dart';

class LoungeCardsTable extends SupabaseTable<LoungeCardsRow> {
  @override
  String get tableName => 'lounge_cards';

  @override
  LoungeCardsRow createRow(Map<String, dynamic> data) => LoungeCardsRow(data);
}

class LoungeCardsRow extends SupabaseDataRow {
  LoungeCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoungeCardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get loungeId => getField<int>('lounge_id')!;
  set loungeId(int value) => setField<int>('lounge_id', value);

  int get cardId => getField<int>('card_id')!;
  set cardId(int value) => setField<int>('card_id', value);
}
