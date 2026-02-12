import '../database.dart';

class FrequentlyAskedQuestionsTable
    extends SupabaseTable<FrequentlyAskedQuestionsRow> {
  @override
  String get tableName => 'frequently_asked_questions';

  @override
  FrequentlyAskedQuestionsRow createRow(Map<String, dynamic> data) =>
      FrequentlyAskedQuestionsRow(data);
}

class FrequentlyAskedQuestionsRow extends SupabaseDataRow {
  FrequentlyAskedQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FrequentlyAskedQuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);
}
