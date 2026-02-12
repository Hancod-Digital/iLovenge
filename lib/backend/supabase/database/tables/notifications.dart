import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get associatedLounge => getField<int>('associated_lounge');
  set associatedLounge(int? value) => setField<int>('associated_lounge', value);

  String get notificationTitle => getField<String>('notification_title')!;
  set notificationTitle(String value) =>
      setField<String>('notification_title', value);

  String get notificationMessage => getField<String>('notification_message')!;
  set notificationMessage(String value) =>
      setField<String>('notification_message', value);

  bool get isApproved => getField<bool>('is_approved')!;
  set isApproved(bool value) => setField<bool>('is_approved', value);
}
