// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmenitiesStruct extends BaseStruct {
  AmenitiesStruct({
    int? id,
    String? imageUrl,
    String? createdAt,
    int? amenitieId,
    String? amenitieLabel,
  })  : _id = id,
        _imageUrl = imageUrl,
        _createdAt = createdAt,
        _amenitieId = amenitieId,
        _amenitieLabel = amenitieLabel;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "amenitie_id" field.
  int? _amenitieId;
  int get amenitieId => _amenitieId ?? 0;
  set amenitieId(int? val) => _amenitieId = val;

  void incrementAmenitieId(int amount) => amenitieId = amenitieId + amount;

  bool hasAmenitieId() => _amenitieId != null;

  // "amenitie_label" field.
  String? _amenitieLabel;
  String get amenitieLabel => _amenitieLabel ?? '';
  set amenitieLabel(String? val) => _amenitieLabel = val;

  bool hasAmenitieLabel() => _amenitieLabel != null;

  static AmenitiesStruct fromMap(Map<String, dynamic> data) => AmenitiesStruct(
        id: castToType<int>(data['id']),
        imageUrl: data['image_url'] as String?,
        createdAt: data['created_at'] as String?,
        amenitieId: castToType<int>(data['amenitie_id']),
        amenitieLabel: data['amenitie_label'] as String?,
      );

  static AmenitiesStruct? maybeFromMap(dynamic data) => data is Map
      ? AmenitiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'image_url': _imageUrl,
        'created_at': _createdAt,
        'amenitie_id': _amenitieId,
        'amenitie_label': _amenitieLabel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'amenitie_id': serializeParam(
          _amenitieId,
          ParamType.int,
        ),
        'amenitie_label': serializeParam(
          _amenitieLabel,
          ParamType.String,
        ),
      }.withoutNulls;

  static AmenitiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AmenitiesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        amenitieId: deserializeParam(
          data['amenitie_id'],
          ParamType.int,
          false,
        ),
        amenitieLabel: deserializeParam(
          data['amenitie_label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AmenitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AmenitiesStruct &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt &&
        amenitieId == other.amenitieId &&
        amenitieLabel == other.amenitieLabel;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, imageUrl, createdAt, amenitieId, amenitieLabel]);
}

AmenitiesStruct createAmenitiesStruct({
  int? id,
  String? imageUrl,
  String? createdAt,
  int? amenitieId,
  String? amenitieLabel,
}) =>
    AmenitiesStruct(
      id: id,
      imageUrl: imageUrl,
      createdAt: createdAt,
      amenitieId: amenitieId,
      amenitieLabel: amenitieLabel,
    );
