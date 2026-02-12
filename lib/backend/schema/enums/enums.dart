import 'package:collection/collection.dart';

enum Gender {
  Male,
  Female,
  Others,
}

enum FlightStatus {
  delayed,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (FlightStatus):
      return FlightStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
