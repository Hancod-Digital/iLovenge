import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';

import '../../backend/supabase/supabase.dart';

String? _lastAppleSignInName;
String? _lastAppleSignInEmail;

String? get lastAppleSignInName => _lastAppleSignInName;
String? get lastAppleSignInEmail => _lastAppleSignInEmail;

String? _composeAppleName(AuthorizationCredentialAppleID credential) {
  final nameParts = [credential.givenName, credential.familyName]
      .map((part) => part?.trim())
      .whereType<String>()
      .where((part) => part.isNotEmpty)
      .toList();
  if (nameParts.isEmpty) {
    return null;
  }
  return nameParts.join(' ');
}

Future<User?> appleSignInFunc() async {
  _lastAppleSignInName = null;
  _lastAppleSignInEmail = null;

  if (kIsWeb) {
    await SupaFlow.client.auth.signInWithOAuth(
      OAuthProvider.apple,
      authScreenLaunchMode: LaunchMode.platformDefault,
    );

    return SupaFlow.client.auth.onAuthStateChange
        .timeout(const Duration(minutes: 5))
        .firstWhere((event) => event.event == AuthChangeEvent.signedIn)
        .then((event) => SupaFlow.client.auth.currentUser);
  }

  final rawNonce = SupaFlow.client.auth.generateRawNonce();
  final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: hashedNonce,
  );
  _lastAppleSignInName = _composeAppleName(credential);
  _lastAppleSignInEmail = credential.email?.trim();

  final idToken = credential.identityToken;
  if (idToken == null) {
    throw const AuthException(
        'Could not find ID Token from generated credential.');
  }

  final authResponse = await SupaFlow.client.auth.signInWithIdToken(
    provider: OAuthProvider.apple,
    idToken: idToken,
    nonce: rawNonce,
  );

  if (authResponse.user != null &&
      _lastAppleSignInName != null &&
      _lastAppleSignInName!.isNotEmpty) {
    try {
      await SupaFlow.client.auth.updateUser(
        UserAttributes(
          data: {
            'full_name': _lastAppleSignInName,
            'name': _lastAppleSignInName,
          },
        ),
      );
    } on AuthException {
      // Ignore metadata update failure; login itself already succeeded.
    }
  }

  return authResponse.user;
}
