import '../database.dart';

class AcceptedCardDetailsTable extends SupabaseTable<AcceptedCardDetailsRow> {
  @override
  String get tableName => 'accepted_card_details';

  @override
  AcceptedCardDetailsRow createRow(Map<String, dynamic> data) =>
      AcceptedCardDetailsRow(data);
}

class AcceptedCardDetailsRow extends SupabaseDataRow {
  AcceptedCardDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AcceptedCardDetailsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get acceptedCardId => getField<int>('accepted_card_id')!;
  set acceptedCardId(int value) => setField<int>('accepted_card_id', value);

  dynamic get cardDetails => getField<dynamic>('card_details')!;
  set cardDetails(dynamic value) => setField<dynamic>('card_details', value);
}
