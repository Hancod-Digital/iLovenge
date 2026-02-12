import '../database.dart';

class UserCardsTable extends SupabaseTable<UserCardsRow> {
  @override
  String get tableName => 'user_cards';

  @override
  UserCardsRow createRow(Map<String, dynamic> data) => UserCardsRow(data);
}

class UserCardsRow extends SupabaseDataRow {
  UserCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get cardId => getField<int>('card_id');
  set cardId(int? value) => setField<int>('card_id', value);
}
