import 'package:rxdart/rxdart.dart';

import '/backend/supabase/supabase.dart';
import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

class ILOVEngeSupabaseUser extends BaseAuthUser {
  ILOVEngeSupabaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;

  String? _metadataString(List<String> keys) {
    final metadata = user?.userMetadata;
    if (metadata == null) {
      return null;
    }

    for (final key in keys) {
      final value = metadata[key];
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return null;
  }

  String? _displayNameFromMetadata() {
    final fullName = _metadataString(
      ['full_name', 'name', 'display_name', 'user_name', 'preferred_username'],
    );
    if (fullName != null) {
      return fullName;
    }

    final givenName = _metadataString(['given_name', 'first_name']);
    final familyName = _metadataString(['family_name', 'last_name']);
    final nameParts = [givenName, familyName]
        .whereType<String>()
        .where((part) => part.isNotEmpty)
        .toList();
    return nameParts.isEmpty ? null : nameParts.join(' ');
  }

  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: user?.id,
        email: user?.email,
        displayName: _displayNameFromMetadata(),
        photoUrl: _metadataString(['avatar_url', 'picture', 'photo_url']),
        phoneNumber: user?.phone,
      );

  @override
  Future? delete() =>
      throw UnsupportedError('The delete user operation is not yet supported.');

  @override
  Future? updateEmail(String email) async {
    final response =
        await SupaFlow.client.auth.updateUser(UserAttributes(email: email));
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? updatePassword(String newPassword) async {
    final response = await SupaFlow.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? sendEmailVerification() => throw UnsupportedError(
      'The send email verification operation is not yet supported.');

  @override
  bool get emailVerified {
    // Reloads the user when checking in order to get the most up to date
    // email verified status.
    if (loggedIn && user!.emailConfirmedAt == null) {
      refreshUser();
    }
    return user?.emailConfirmedAt != null;
  }

  @override
  Future refreshUser() async {
    await SupaFlow.client.auth
        .refreshSession()
        .then((_) => user = SupaFlow.client.auth.currentUser);
  }
}

/// Generates a stream of the authenticated user.
/// [SupaFlow.client.auth.onAuthStateChange] does not yield any values until the
/// user is already authenticated. So we add a default null user to the stream,
/// if we need to interact with the [currentUser] before logging in.
Stream<BaseAuthUser> iLOVEngeSupabaseUserStream() {
  final supabaseAuthStream = SupaFlow.client.auth.onAuthStateChange.debounce(
      (authState) => authState.event == AuthChangeEvent.tokenRefreshed
          ? TimerStream(authState, Duration(seconds: 1))
          : Stream.value(authState));
  return (!loggedIn
          ? Stream<AuthState?>.value(null).concatWith([supabaseAuthStream])
          : supabaseAuthStream)
      .map<BaseAuthUser>(
    (authState) {
      currentUser = ILOVEngeSupabaseUser(authState?.session?.user);
      return currentUser!;
    },
  );
}
