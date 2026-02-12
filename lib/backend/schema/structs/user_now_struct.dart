// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNowStruct extends BaseStruct {
  UserNowStruct({
    String? name,
    String? email,
    String? gender,
    String? userId,
    String? fcmToken,
    int? userRole,
    String? userType,
    String? createdAt,
    String? profileUrl,
    String? phoneNumber,
    String? dateOfBirth,
    String? dashboardMessage,
  })  : _name = name,
        _email = email,
        _gender = gender,
        _userId = userId,
        _fcmToken = fcmToken,
        _userRole = userRole,
        _userType = userType,
        _createdAt = createdAt,
        _profileUrl = profileUrl,
        _phoneNumber = phoneNumber,
        _dateOfBirth = dateOfBirth,
        _dashboardMessage = dashboardMessage;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  set fcmToken(String? val) => _fcmToken = val;

  bool hasFcmToken() => _fcmToken != null;

  // "user_role" field.
  int? _userRole;
  int get userRole => _userRole ?? 0;
  set userRole(int? val) => _userRole = val;

  void incrementUserRole(int amount) => userRole = userRole + amount;

  bool hasUserRole() => _userRole != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "profile_url" field.
  String? _profileUrl;
  String get profileUrl => _profileUrl ?? '';
  set profileUrl(String? val) => _profileUrl = val;

  bool hasProfileUrl() => _profileUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "dashboard_message" field.
  String? _dashboardMessage;
  String get dashboardMessage => _dashboardMessage ?? '';
  set dashboardMessage(String? val) => _dashboardMessage = val;

  bool hasDashboardMessage() => _dashboardMessage != null;

  static UserNowStruct fromMap(Map<String, dynamic> data) => UserNowStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        gender: data['gender'] as String?,
        userId: data['user_id'] as String?,
        fcmToken: data['fcm_token'] as String?,
        userRole: castToType<int>(data['user_role']),
        userType: data['user_type'] as String?,
        createdAt: data['created_at'] as String?,
        profileUrl: data['profile_url'] as String?,
        phoneNumber: data['phone_number'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        dashboardMessage: data['dashboard_message'] as String?,
      );

  static UserNowStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserNowStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'gender': _gender,
        'user_id': _userId,
        'fcm_token': _fcmToken,
        'user_role': _userRole,
        'user_type': _userType,
        'created_at': _createdAt,
        'profile_url': _profileUrl,
        'phone_number': _phoneNumber,
        'date_of_birth': _dateOfBirth,
        'dashboard_message': _dashboardMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'fcm_token': serializeParam(
          _fcmToken,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.int,
        ),
        'user_type': serializeParam(
          _userType,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'profile_url': serializeParam(
          _profileUrl,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'dashboard_message': serializeParam(
          _dashboardMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserNowStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserNowStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        fcmToken: deserializeParam(
          data['fcm_token'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.int,
          false,
        ),
        userType: deserializeParam(
          data['user_type'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        profileUrl: deserializeParam(
          data['profile_url'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        dashboardMessage: deserializeParam(
          data['dashboard_message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserNowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserNowStruct &&
        name == other.name &&
        email == other.email &&
        gender == other.gender &&
        userId == other.userId &&
        fcmToken == other.fcmToken &&
        userRole == other.userRole &&
        userType == other.userType &&
        createdAt == other.createdAt &&
        profileUrl == other.profileUrl &&
        phoneNumber == other.phoneNumber &&
        dateOfBirth == other.dateOfBirth &&
        dashboardMessage == other.dashboardMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        email,
        gender,
        userId,
        fcmToken,
        userRole,
        userType,
        createdAt,
        profileUrl,
        phoneNumber,
        dateOfBirth,
        dashboardMessage
      ]);
}

UserNowStruct createUserNowStruct({
  String? name,
  String? email,
  String? gender,
  String? userId,
  String? fcmToken,
  int? userRole,
  String? userType,
  String? createdAt,
  String? profileUrl,
  String? phoneNumber,
  String? dateOfBirth,
  String? dashboardMessage,
}) =>
    UserNowStruct(
      name: name,
      email: email,
      gender: gender,
      userId: userId,
      fcmToken: fcmToken,
      userRole: userRole,
      userType: userType,
      createdAt: createdAt,
      profileUrl: profileUrl,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      dashboardMessage: dashboardMessage,
    );
