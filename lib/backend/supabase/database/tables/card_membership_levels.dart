import '../database.dart';

class CardMembershipLevelsTable extends SupabaseTable<CardMembershipLevelsRow> {
  @override
  String get tableName => 'card_membership_levels';

  @override
  CardMembershipLevelsRow createRow(Map<String, dynamic> data) =>
      CardMembershipLevelsRow(data);
}

class CardMembershipLevelsRow extends SupabaseDataRow {
  CardMembershipLevelsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CardMembershipLevelsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get memebershipLevels => getField<String>('memebership_levels')!;
  set memebershipLevels(String value) =>
      setField<String>('memebership_levels', value);
}
